package Factorial::Base;

use strict;
use warnings;

sub new { bless {}, shift }

sub calculate {
    die "'calculate' method must be overridden in child class";
}

1;