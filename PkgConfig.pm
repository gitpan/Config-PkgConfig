package Config::PkgConfig;

use 5.006001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw( ) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw( modversion listall modexists);

our $VERSION = '0.01';

sub modversion {
  my $mod = shift;
  chomp(my $answer = `pkg-config --modversion $mod --silence-errors`);
  return undef if ($answer eq "");
  return $answer;
}

sub modlibs {
  my $mods = join(" ",@_);
  chomp(my $answer = `pkg-config --libs $mods`);
  if ($answer eq "") {
    return undef
  } else {
    return $answer;
  }
}

sub listall {
  my @answer = `pkg-config --list-all`;
  my %answer = ();
  for (@answer) {
    chomp;
    m!^(\S+)\s+(.*)$!;
    $answer{$1} = $2;
  }
  return %answer;
}

sub modexists {
  my $mod = shift;
  my $answer = `pkg-config --exists $mod && echo yes`;
  if ($answer eq "yes") {
    return 1
  } else {
    return 0
  }
}


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Config::PkgConfig - Perl extension to interact with pck-config

=head1 SYNOPSIS

  use Config::PkgConfig;

  $version = modversion("glib-2.0");

  %modules = listall();

  if (modexists("gtk+-2.0")) { ... }

  

=head1 ABSTRACT

  The module idea is to provide helpful methods over package-config
  such that the user does not need to use it directly.

=head1 DESCRIPTION

  .. to be provided ..

=head1 AUTHOR

Alberto Simoes, E<lt>ambs@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Alberto Simoes

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
