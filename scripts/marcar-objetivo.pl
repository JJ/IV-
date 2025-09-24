#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;
use Git;
use Getopt::Long;

my $objetivo;
my $usuario;
my $help = 0;

GetOptions(
    "objetivo=i" => \$objetivo,
    "usuario=s"  => \$usuario,
    "help|h"     => \$help,
) or die("Error in command line arguments\n");

if ($help || !defined($objetivo) || !defined($usuario)) {
    print_usage();
    exit(0);
}

sub print_usage {
    say "Uso: marcar-objetivo.pl --objetivo=N --usuario=USUARIO";
    say "";
    say "Marca un objetivo como alcanzado para un usuario específico";
    say "";
    say "Opciones:";
    say "  --objetivo=N    Número del objetivo (0, 1, 2, etc.)";
    say "  --usuario=USER  Usuario de GitHub (nick)";
    say "  --help|-h       Muestra esta ayuda";
    say "";
    say "Ejemplo:";
    say "  marcar-objetivo.pl --objetivo=0 --usuario=jorgelopez-ugr";
}

# Construir el nombre del archivo del objetivo
my $objetivo_file = "proyectos/objetivo-$objetivo.md";

if (!-e $objetivo_file) {
    die "❌ Error: El archivo $objetivo_file no existe\n";
}

# Leer el contenido del archivo
open my $fh, '<', $objetivo_file or die "❌ Error: No se puede leer $objetivo_file: $!\n";
my @lines = <$fh>;
close $fh;

# Remover saltos de línea
chomp @lines;
my $found = 0;
my $modified = 0;

for my $i (0..$#lines) {
    my $line = $lines[$i];
    
    # Buscar líneas que contengan github.com y el usuario
    if ($line =~ /github\.com\/\Q$usuario\E/ && $line =~ /\|.*\|.*\|/) {
        # Verificar si ya está marcado
        if ($line =~ /\|\s*✓\s*\|$/) {
            say "⚠️  El objetivo $objetivo para el usuario $usuario ya está marcado como alcanzado";
            exit(0);
        }
        
        # Marcar como alcanzado reemplazando la última columna
        $line =~ s/\|\s*\|\s*$/| ✓         |/;
        $lines[$i] = $line;
        $found = 1;
        $modified = 1;
        last;
    }
}

if (!$found) {
    die "❌ Error: No se encontró el usuario '$usuario' en el archivo $objetivo_file\n";
}

if ($modified) {
    # Escribir el archivo modificado
    open my $out_fh, '>', $objetivo_file or die "❌ Error: No se puede escribir $objetivo_file: $!\n";
    for my $line (@lines) {
        say $out_fh $line;
    }
    close $out_fh;
    
    # Crear commit con Git
    my $repo = Git->repository;
    
    # Añadir el archivo al índice
    $repo->command('add', $objetivo_file);
    
    # Crear el commit
    my $commit_message = "👍 \@$usuario";
    $repo->command('commit', '-m', $commit_message);
    
    say "✅ Objetivo $objetivo marcado como alcanzado para \@$usuario";
    say "✅ Commit creado: $commit_message";
} else {
    say "❌ No se realizaron cambios";
    exit(1);
}