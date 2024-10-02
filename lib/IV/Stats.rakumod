use IO::Glob;
use Git::File::History;

use IV::Stats::Utils;
unit class IV::Stats;

has @!student-list;
has %!students;
has %!versiones;
has @!objetivos;
has @!entregas;

my @cumplimiento = [.05, .075, .15, .075, .15, 0.075, 0.075, 0.1, 0.125, 0.125];

method new(Str $file = "{ PROYECTOS }usuarios.md") {
    my @student-list = lista-estudiantes($file);
    my %students;
    my @objetivos;
    my @entregas;
    my %versiones;
    @student-list.map: { %students{$_} = { :objetivos(set()), :entrega(0) } };

    for glob("{ PROYECTOS }objetivo-*.md").sort: { $^a cmp $^b } -> $f {
        my ($objetivo) := $f ~~ /(\d+)/;
        my $contenido = $f.IO.slurp();
        my %estado-objetivos =
                estado-objetivos( @student-list, $contenido, $objetivo );
        @objetivos[$objetivo] = set();
        @entregas[$objetivo] = set();
        for @student-list -> $usuario {
            if defined %estado-objetivos{$usuario} {
                my $estado-objetivo = %estado-objetivos{$usuario};
                if $estado-objetivo<estado> == CUMPLIDO  {
                    %students{$usuario}<objetivos> ∪= +$objetivo;
                    %students{$usuario}<entrega> = +$objetivo;
                    @objetivos[$objetivo] ∪= $usuario;
                    @entregas[$objetivo] ∪= $usuario;
                } elsif $estado-objetivo<estado> == ENVIADO {
                    %students{$usuario}<entrega> = +$objetivo;
                    @entregas[$objetivo] ∪= $usuario;
                }
                %versiones{$usuario} = $estado-objetivo<version>;
            }
        }
    }
    self.bless(:@student-list, :%students, :@objetivos, :@entregas, :%versiones);
}

submethod BUILD(:@!student-list, :%!students, :@!objetivos, :@!entregas, :%!versiones) {}

method objetivos-de(Str $user) {
    return %!students{$user}<objetivos>;
}

method entregas-de(Str $user) {
    return %!students{$user}<entrega>;
}

method cumple-objetivo(UInt $objetivo) {
    return @!objetivos[$objetivo];
}

method hecha-entrega(UInt $entrega) {
    return @!entregas[$entrega];
}

method bajas-objetivos(UInt $objetivo) {
    return @!objetivos[$objetivo] ⊖ @!objetivos[$objetivo + 1];
}

method bajas-totales(UInt $objetivo) {
    return @!objetivos[$objetivo] ⊖ @!entregas[$objetivo + 1];
}

method objetivos() {
    return @!entregas.keys;
}

method estudiantes() {
    return @!student-list;
}

method versiones() {
    return %!versiones;
}

method objetivos-cumplidos() {
    return @!objetivos.map(*.keys.sort({ $^a.lc cmp $^b.lc }));
}

method percentiles() {
    my %percentile-of;
    for @!objetivos -> $objetivo {
        my $percentile = $objetivo.elems() / %!students.keys.elems();
        for $objetivo.keys -> $student {
            %percentile-of{$student} = $percentile;
        }
    }
    return %percentile-of;
}

method notas(--> Seq) {
    return gather for @!student-list -> $u {
        take self.nota-de($u) * 7;
    }
}

method nota-de(Str $student) {
    my $nota = 0;
    for  %!students{$student}<objetivos>.list.keys -> $n {
        $nota += @cumplimiento[$n];
    }
    return $nota
}
