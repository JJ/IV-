#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use JSON;
use File::Slurper 'read_text';
use GitHub::Actions;
use LWP::UserAgent;


# subs
sub procesa_entregas( $ $ $ ) {
  my $entregas_csv = shift;
  my $user = shift;
  my $objetivo = shift;
  my @lines = split("\n",$entregas_csv);
  my @this_objetivo = grep /^$objetivo;/, @lines;
  my @users = map { my @columnas = split(/;\s*/); $columnas[1] } @this_objetivo;
  return grep $_ ne $user, @users;
}

#-------------------

use constant MAXREVIEWERS => 5;

my $filename = "data/fechas-entrega.csv";
my $entregas_csv;

if ( -e $filename ) {
  $entregas_csv = read_text( $filename );
} elsif ( -e "../$filename" ) {
  $entregas_csv = read_text( "../$filename" );
} else {
  die "No encuentro el fichero de entregas";
}

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

my $num_reviewers = scalar(@these_students) < MAXREVIEWERS ? scalar(@these_students) : MAXREVIEWERS;

my @reviewers;
for ( my $i = 0; $i < $num_reviewers; $i ++ ) {
  my $this_reviewer = splice( @these_students, int(rand( $#these_students ) ), 1 );
  push( @reviewers, "\@".$this_reviewer );
}

my $data = "[🔗](https://github.com/$user/$repo/pull/$pull_number) ⛹ Revisores → ". join(" :heavy_plus_sign: ", @reviewers);
my $post_data = sprintf('{"body":"%s"}', $data);
my $url = sprintf('https://api.github.com/repos/JJ/IV-/issues/%s/comments', $pr_number);

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

