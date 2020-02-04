package Factorial::TrivialWithRecursion;

use strict;
use warnings;
no warnings 'recursion';
use bignum try => 'GMP';

use base 'Factorial::Base';

sub calculate {
    my ( $self, $num ) = @_;

    return unless defined $num && $num >= 0;
    return _recursive_computing( $num );
}

sub _recursive_computing {
    if ( $_[0] == 0 ) {
        return 1;
    }
    else {
        return $_[0] * _recursive_computing( $_[0] - 1 );
    }
}

1;