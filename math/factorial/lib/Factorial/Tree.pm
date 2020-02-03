package Factorial::Tree;

use strict;
use warnings;
use bignum try => 'GMP';

sub new { bless {}, shift }

sub calculate {
    my ( $self, $num ) = @_;

    return unless defined $num && $num >= 0;

    if ( $num <= 2 ) {
        if ( $num == 0 ) {
            return 1;
        }
        elsif ( $num == 1 || $num == 2 ) {
            return $num;
        }
    }
    else {
        return $self->_tree_traversal(2, $num);
    }
}

sub _tree_traversal {
    my ( $self, $l, $r ) = @_;

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
        return $self->_tree_traversal( $l, $m ) 
             * $self->_tree_traversal( $m + 1, $r );
    }
}

1;