#!/opt/local/bin/perl

use strict;
use warnings;

use Data::Dumper;
use YAML::XS qw/LoadFile/;

my $d = LoadFile('Demo/demo.details') or die $!;

print Dumper $d;
