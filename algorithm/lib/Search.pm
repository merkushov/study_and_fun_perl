package Search;

use strict;
use warnings;

sub new { bless {}, shift }

sub binary_search {
    my ( $self, $array, $number ) = @_;

    my $l = 0;
    my $r = scalar( @{$array} ) - 1;

    while ( $l <= $r ) {
        my $m = int( ($l + $r) / 2 );

        if ( $array->[$m] < $number ) {
            $l = $m + 1;
        }
        elsif ( $array->[$m] > $number ) {
            $r = $m - 1;
        }
        else {
            return $m
        }
    }

    return;
}

1;