#!/usr/bin/env perl6

use IV::Stats;

my $stats = IV::Stats.new;
my $todos = $stats.estudiantes.elems;

for $stats.objetivos -> $o {
    my %r = $stats.resumen($o);
    say sprintf( "%2d 🧮: %2d%%🚧 %2d%%✅ %2d%%❌ ⇒ \n     ",
            $o,
            %r<pendientes> *100/ $todos,
            %r<aceptados>*100/ $todos,
            %r<sin-entregar>*100/$todos  ),
            ("🚧" xx %r<pendientes>,
            "✅" xx %r<aceptados>,
            "❌" xx %r<sin-entregar>).Slip.join("\n     ");

}
