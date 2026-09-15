requires "IO::Socket::SSL", "> 2.099";
requires "File::Slurper";
requires "Git";
requires "JSON";
requires "GitHub::Actions";
requires "LWP::UserAgent";
requires "App::FatPacker";

on 'test' => sub {
  requires "Test::More";
};
