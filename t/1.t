# -*- cperl -*-

use Test::More tests => 4;
BEGIN { use_ok('Config::PkgConfig') };
use Config::PkgConfig;


is(modversion("stupidmodule"),undef);

@x = listall();
if (@x == 0) {
  ok(1)
} else {
  ok (@x%2==0)
}

is(modexists("stupidmodule"),0);
