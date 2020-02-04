package Factorial::Trivial;

use strict;
use warnings;
use bignum try => 'GMP';

use base 'Factorial::Base';

sub calculate {
    my ( $self, $num ) = @_;

    return unless defined $num && $num >= 0;

    my $result = 1;
    for ( my $i = 2; $i <= $num; $i++) {
        $result *= $i;
    }

    return $result;
}

1;