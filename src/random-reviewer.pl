#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use JSON;
use GitHub::Actions;
use LWP::UserAgent;

use FindBin;
use lib "$FindBin::Bin/../lib";
use IV::RandomReviewer qw(carga_entregas procesa_entregas elige_revisores construye_comentario);

#-------------------

my $filename     = "data/fechas-entrega.csv";
my $entregas_csv = carga_entregas( $filename );

my $este_objetivo = $ENV{'objetivo'} || 0;
my $user          = $ENV{'user'};
my $repo          = $ENV{'repo'};
my $pull_number   = $ENV{'pull_number'};
my $auth_token    = $ENV{'COMMENT_TOKEN'};
my $pr_number     = $ENV{'this_pr_number'};

my @these_students = procesa_entregas( $entregas_csv, $user, $este_objetivo );

if ( !@these_students ) {
  warning( "Todavía no hay suficientes personas para poder revisarlo" );
  exit(0);
}

my @reviewers = elige_revisores( @these_students );

my $data      = construye_comentario( $user, $repo, $pull_number, @reviewers );
my $post_data = sprintf( '{"body":"%s"}', $data );
my $url       = sprintf( 'https://api.github.com/repos/JJ/IV-/issues/%s/comments', $pr_number );

warning($data);

my $ua = LWP::UserAgent->new();
my $request = new HTTP::Request('POST' => $url,
                                [
                                 'Authorization' => "Bearer $auth_token",
                                 'Accept' =>  'application/vnd.github+json'
                                ]);
$request->content($post_data);
my $response;

eval { $response = $ua->request($request)->as_string() } || set_failed "No puedo poner comentario: $@";

warning($response);
