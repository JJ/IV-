#!/usr/bin/env raku

use IV::Stats::Utils;

my OBJETIVO0_FILE = "proyectos/objetivo-0.md";

my @student-list = lista-estudiantes();
my @lista-objetivo0 = lista-estudiantes(OBJETIVO0_FILE);

my @missing;

for @student-list.kv -> $index, $student {
    say $student, "-",  @lista-objetivo0[$index];
    if @lista-objetivo0[$index] ne $student {
        @missing.push: ( $student, @lista-objetivo0[$index]);
    }
}

if @missing {
    my $content = OBJETIVO0_FILE.IO.slurp();
    for @missing -> ( $new-nick, $old-nick) {
        $content ~~ s/$old-nick/$new-nick/;
    }
    say $content;
}