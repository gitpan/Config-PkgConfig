use ExtUtils::MakeMaker;

# Check if we have pkg-config
chomp(my $pkgconfig = `pkg-config --version`);

if ($pkgconfig =~ m!^(\d+)\.(\d+)\.(\d+)$!) {
  my ($version,$subversion,$subsubversion) = ($1,$2,$3);
  die "I need pkg-config version 0.15.0 of above\n" if $subversion<15;
} else {
  die "I need pkg-config on my path\n"
}



# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Config::PkgConfig',
    'VERSION_FROM'	=> 'PkgConfig.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'PkgConfig.pm', # retrieve abstract from module
       AUTHOR     => 'Alberto Simoes <ambs@cpan.org>') : ()),
);
