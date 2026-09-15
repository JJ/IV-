package IV::CheckVersion;

use strict;
use warnings;
use v5.14;

use Exporter 'import';
our @EXPORT_OK = qw(valida_version);

sub valida_version {
  my ( $this_version, $objetivo ) = @_;
  my $correctVersion = "v0.$objetivo";

  if ( index( $this_version, $correctVersion ) == -1 ) {
    return ( 0, "La versión $this_version es incorrecta: debería comenzar con $correctVersion" );
  }

  if ( $this_version eq 'v0.0.0' ) {
    return ( 0, "Una versión 0.0.0 es incorrecta; la primera versión posible es la 0.0.1" );
  }

  return ( 1, "La versión $this_version es adecuada para este objetivo" );
}

1;
