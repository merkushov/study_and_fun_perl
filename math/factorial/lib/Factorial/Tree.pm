package Factorial::Tree;

use strict;
use warnings;
no warnings 'recursion';
use bignum try => 'GMP';

use base 'Factorial::Base';
use Sub::Recursive;

sub calculate {
    my ( $self, $num ) = @_;

    return unless defined $num && $num >= 0;

    # recursive function (based on the Sub::Recursive module)
    my $tree_traversal = recursive {
        my ( $l, $r ) = @_;

        if ( $l > $r ) {
            return 1;
        }
        elsif ( $l == $r ) {
            return $l;
        }
        elsif ( $r - $l == 1 ) {
            return $l * $r;
        }
        else {
            my $m = int( ( $l + $r ) / 2 );
            return $REC->( $l, $m ) * $REC->( $m + 1, $r );
        }
    };

    if ( $num <= 2 ) {
        if ( $num == 0 ) {
            return 1;
        }
        elsif ( $num == 1 || $num == 2 ) {
            return $num;
        }
    }
    else {

        # WARNING! A special call to a recursive function 
        # (based on the Sub::Recursive module) to avoid memory leaks
        return $tree_traversal->(2, $num);
    }
}

1;