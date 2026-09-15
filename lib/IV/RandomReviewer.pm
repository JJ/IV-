package IV::RandomReviewer;

use strict;
use warnings;
use v5.14;

use File::Slurper 'read_text';
use Exporter 'import';
our @EXPORT_OK = qw(
  carga_entregas
  procesa_entregas
  elige_revisores
  construye_comentario
  MAXREVIEWERS
);

use constant MAXREVIEWERS => 5;

sub carga_entregas {
  my $filename = shift;

  if ( -e $filename ) {
    return read_text( $filename );
  } elsif ( -e "../$filename" ) {
    return read_text( "../$filename" );
  } else {
    die "No encuentro el fichero de entregas";
  }
}

sub procesa_entregas {
  my ( $entregas_csv, $user, $objetivo ) = @_;
  my @lines = split( "\n", $entregas_csv );
  my @this_objetivo = grep /^$objetivo;/, @lines;
  my @users = map { my @columnas = split(/;\s*/); $columnas[1] } @this_objetivo;
  return grep { $_ ne $user } @users;
}

sub elige_revisores {
  my @candidatos = @_;
  my $num_reviewers = scalar(@candidatos) < MAXREVIEWERS ? scalar(@candidatos) : MAXREVIEWERS;

  my @reviewers;
  for ( my $i = 0; $i < $num_reviewers; $i++ ) {
    my $this_reviewer = splice( @candidatos, int( rand( $#candidatos ) ), 1 );
    push( @reviewers, $this_reviewer );
  }
  return @reviewers;
}

sub construye_comentario {
  my ( $user, $repo, $pull_number, @reviewers ) = @_;
  return "[🔗](https://github.com/$user/$repo/pull/$pull_number) ⛹ Revisores → "
    . join( " :heavy_plus_sign: ", map { "\@$_" } @reviewers );
}

1;
