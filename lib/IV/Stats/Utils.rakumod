unit module IV::Stats::Utils;

use IO::Glob;

constant PROYECTOS is export = "proyectos/";
constant ASIGNACIONES is export = "{ PROYECTOS }asignaciones-objetivo-2.md";

sub lista-estudiantes(Str $file = "{ PROYECTOS }usuarios.md") is export {
    my @nick-lines = $file.IO.slurp.lines.grep(/"<!--"/)
            .map(*.split(/\s*"--"\s*/)[1]);

    return @nick-lines.map(*.split(/"Enlace de"\s+/)[1])
}

sub asignaciones-objetivo2()  is export returns Associative {
    my @asignaciones = "{ ASIGNACIONES }".IO.lines[4 ..*];

    my %asignaciones;
    for @asignaciones -> $line {
        my ($programador,$product-manager) = $line.split(/\s* "|" \s*/)[1, 2];
        %asignaciones{$product-manager} = $programador;
    }
    return %asignaciones;
}

enum Estados is export <CUMPLIDO ENVIADO INCOMPLETO NINGUNO>;

sub estado-objetivos( @student-list, $contenido, $objetivo ) is export {
    my @contenido = $contenido.split("\n").grep(/"|"/)[2..*];
    my %estados;
    my %asignaciones = asignaciones-objetivo2();
    for @contenido -> $linea {
        my $usuario;
        next unless $linea ~~ /github/;
        $linea ~~ /"github.com/" $<usuario> = (\S+?) "/"/;
        $usuario = $<usuario>;
        if ( $objetivo == 2 ) {
            $usuario = %asignaciones{$<usuario>}
        }
        my $marca = $linea // "";
        if  $marca  ~~  /"✓"/ {
            %estados{$usuario}<estado> = CUMPLIDO;
        } elsif  $marca ~~ /"✗"/  {
            %estados{$usuario}<estado> = INCOMPLETO;
        } elsif  $marca ~~ /"github.com"/  {
            %estados{$usuario}<estado> = ENVIADO
        }
        $linea ~~ / v $<version> = ( \d+\.\d+\.\d+)/;
        %estados{$usuario}<version> = Version.new($<version> // v0.0.0 );
    }
    return %estados;
}
