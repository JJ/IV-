use strict;
use warnings;
use v5.14;

use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";

use IV::CheckVersion qw(valida_version);

my ( $ok, $msg );

( $ok, $msg ) = valida_version( 'v0.3.1', 3 );
ok( $ok, 'versión que empieza por v0.<objetivo> es válida' );
like( $msg, qr/adecuada/, 'mensaje de éxito menciona que es adecuada' );

( $ok, $msg ) = valida_version( 'v0.4.0', 3 );
ok( !$ok, 'versión que no empieza por v0.<objetivo> es inválida' );
like( $msg, qr/incorrecta/, 'mensaje de error menciona que es incorrecta' );

( $ok, $msg ) = valida_version( 'v0.0.0', 0 );
ok( !$ok, 'v0.0.0 siempre es inválida, aunque empiece por v0.<objetivo>' );
like( $msg, qr/0\.0\.0/, 'mensaje de error menciona la versión 0.0.0' );

( $ok, $msg ) = valida_version( 'v0.0.1', 0 );
ok( $ok, 'v0.0.1 es la primera versión válida para el objetivo 0' );

done_testing();
