#!/usr/bin/env raku

my @lines-usuarios = "proyectos/usuarios.md".IO.lines.grep(/"<!--"/);
my $objetivo-file = "proyectos/objetivo-1.md".IO.slurp;
my @lines-objetivos = $objetivo-file.split("\n").grep(/^\|\s*/);
shift @lines-objetivos;
shift @lines-objetivos;
for @lines-objetivos.kv -> $i, $line {
    next if $line ~~ /github/;
    next if $line eq @lines-usuarios[$i];
    $line ~~ /"Enlace de " $<iniciales>=(.+?) \s+ "-->"/;
    my $iniciales = $<iniciales>;
    @lines-usuarios[$i] ~~ /"Enlace de " $<iniciales-prima>=(.+?) \s+ "-->"/;
    my $iniciales-prima = $<iniciales-prima>;
    if $iniciales ne $iniciales-prima {
        $objetivo-file ~~ s:g/ $iniciales /$iniciales-prima/;
    }
}

say $objetivo-file;


