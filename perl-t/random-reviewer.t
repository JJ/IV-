use strict;
use warnings;
use v5.14;

use Test::More;
use File::Temp qw(tempdir);
use Cwd qw(getcwd);
use FindBin;
use lib "$FindBin::Bin/../lib";

use IV::RandomReviewer qw(
  carga_entregas
  procesa_entregas
  elige_revisores
  construye_comentario
);

# --- procesa_entregas ---

my $csv = join( "\n",
  "0; ana; 2026-01-01",
  "0; bea; 2026-01-02",
  "0; cris; 2026-01-03",
  "1; deb; 2026-01-04",
);

my @entregados = procesa_entregas( $csv, 'ana', 0 );
is_deeply( [ sort @entregados ], [ 'bea', 'cris' ],
  'procesa_entregas devuelve los usuarios del objetivo, sin el propio usuario' );

my @otro_objetivo = procesa_entregas( $csv, 'deb', 1 );
is_deeply( \@otro_objetivo, [], 'procesa_entregas no incluye al único entregador del objetivo' );

# --- elige_revisores ---

my @pocos = elige_revisores( 'ana', 'bea' );
is( scalar(@pocos), 2, 'elige_revisores no puede elegir más revisores que candidatos' );
is_deeply( [ sort @pocos ], [ 'ana', 'bea' ], 'elige_revisores devuelve todos los candidatos si hay pocos' );

my @muchos = elige_revisores( map { "user$_" } 1 .. 10 );
is( scalar(@muchos), IV::RandomReviewer::MAXREVIEWERS(), 'elige_revisores respeta el máximo de revisores' );
is( scalar( grep { /^user\d+$/ } @muchos ), scalar(@muchos), 'todos los revisores elegidos vienen de los candidatos' );

my %vistos;
$vistos{$_}++ for @muchos;
ok( !( grep { $_ > 1 } values %vistos ), 'elige_revisores no repite candidatos' );

# --- construye_comentario ---

my $comentario = construye_comentario( 'ana', 'mi-repo', 42, 'bea', 'cris' );
like( $comentario, qr{https://github.com/ana/mi-repo/pull/42}, 'construye_comentario incluye el enlace al PR' );
like( $comentario, qr{\@bea}, 'construye_comentario menciona a los revisores con @' );
like( $comentario, qr{\@cris}, 'construye_comentario menciona a todos los revisores' );

# --- carga_entregas ---

my $dir = tempdir( CLEANUP => 1 );
my $original_cwd = getcwd();

mkdir "$dir/aqui";
mkdir "$dir/aqui/subdir";
open( my $fh, '>', "$dir/aqui/entregas.csv" ) or die $!;
print $fh "contenido\n";
close $fh;

chdir "$dir/aqui" or die $!;
is( carga_entregas('entregas.csv'), "contenido\n", 'carga_entregas lee el fichero si está en el directorio actual' );

chdir "$dir/aqui/subdir" or die $!;
is( carga_entregas('entregas.csv'), "contenido\n", 'carga_entregas usa el fallback ../fichero si no está en el actual' );

eval { carga_entregas('no-existe.csv') };
like( $@, qr/No encuentro el fichero/, 'carga_entregas muere si no encuentra el fichero en ningún sitio' );

chdir $original_cwd or die $!;

done_testing();
