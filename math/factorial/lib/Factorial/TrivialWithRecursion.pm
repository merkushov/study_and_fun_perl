package Factorial::TrivialWithRecursion;

use strict;
use warnings;
no warnings 'recursion';
use bignum try => 'GMP';

use base 'Factorial::Base';
use Sub::Recursive;

sub calculate {
    my $self = shift;
    my $num = shift;

    return unless defined $num && $num >= 0;

    # WARNING! A special call to a recursive function 
    # (based on the Sub::Recursive module) to avoid memory leaks
    return recursive { $_[0] <= 1 ? 1 : $_[0] * $REC->($_[0] - 1) }->($num)
}

1;