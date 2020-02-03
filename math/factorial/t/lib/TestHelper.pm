package TestHelper;

use strict;
use warnings;
use bignum try => 'GMP';

# use Data::Dumper;
use Test::More;

sub config {
    return {
        factorial_example => {
            0 => 1,
            1 => 1,
            2 => 2,
            3 => 6,
            5 => 120,
            10 => 3628800,
            42 => 1405006117752879898543142606244511569936384000000000,
        }
    }
}

sub simple_check {
    my $obj = shift;

    ok $obj && ( ref $obj ) =~ m/^Factorial::/, "This is an object";
    ok $obj->can('calculate'), "The object has an 'calculate' method";

    my $result = $obj->calculate( 5 );
    ok $result, "Got result";
    cmp_ok $result, '==', 120, "The expected result was obtained";
}

sub check_calculation_result {
    my $obj = shift;

    ok $obj && ( ref $obj ) =~ m/^Factorial::/, "This is an object";
    my $map = config()->{factorial_example};

    for my $k ( sort { $a <=> $b } keys %{$map} ) {
        my $result = $obj->calculate( $k );

        cmp_ok $result, '==', $map->{$k},
            "The expected result was obtained for $k!";
    }
}

1;