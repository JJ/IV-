#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use GitHub::Actions;

my $correctVersion = "v0." . $ENV{'OBJETIVO'};

if ( index( $ENV{'THIS_VERSION'}, $correctVersion ) == -1 ) {
  set_failed( "La versión $ENV{'THIS_VERSION'} es incorrecta: debería comenzar con $correctVersion");
} else {
  debug( "La versión $ENV{'THIS_VERSION'} es adecuada para este objetivo" );
}

