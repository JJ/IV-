#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;
use Git;

my ($objetivo, $usuario) = @ARGV;

if (!defined($objetivo) || !defined($usuario)) {
    say "Uso: marcar-objetivo.pl OBJETIVO USUARIO";
    say "Ejemplo: marcar-objetivo.pl 0 jorgelopez-ugr";
    exit(1);
}

# Construir el nombre del archivo del objetivo
my $objetivo_file = "proyectos/objetivo-$objetivo.md";

if (!-e $objetivo_file) {
    die "❌ Error: El archivo $objetivo_file no existe\n";
}

# Leer el contenido del archivo
open my $fh, '<', $objetivo_file or die "❌ Error: No se puede leer $objetivo_file: $!\n";
my $content = do { local $/; <$fh> };
close $fh;

# Verificar si ya está marcado
if ($content =~ /github\.com\/\Q$usuario\E.*\|\s*✓\s*\|/m) {
    say "⚠️  El objetivo $objetivo para el usuario $usuario ya está marcado como alcanzado";
    exit(0);
}

# Hacer la sustitución directamente
my $changes = $content =~ s/(github\.com\/\Q$usuario\E[^|]*\|[^|]*)\|\s*\|/$1| ✓         |/gm;

if (!$changes) {
    die "❌ Error: No se encontró el usuario '$usuario' en el archivo $objetivo_file\n";
}

# Escribir el archivo modificado
open my $out_fh, '>', $objetivo_file or die "❌ Error: No se puede escribir $objetivo_file: $!\n";
print $out_fh $content;
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