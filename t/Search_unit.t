#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Test::More;
use lib 'algorithm/lib';

BEGIN { use_ok 'Search' }

subtest "Init object" => sub {
    my $obj = Search->new();

    ok $obj, "A new object has been defined";
    cmp_ok ref $obj, 'eq', 'Search', "The type of the new object is 'Search'";
};

subtest "Method binary_search: Checking Return Values" => sub {
    my $obj = Search->new();

    my $defined_position = $obj->binary_search( [qw/ 1 2 3 4 5 /], 2 );
    ok defined $defined_position,
        "For an existing value, the method returned a defined result";
    cmp_ok $defined_position, '==', 1, "The expected result returned";

    my $undefined_position = $obj->binary_search( [qw/ 1 2 3 4 5 /], 9 );
    ok ! defined $undefined_position, 
        "For an unexisting value, the method returned a undefined result";
};

subtest "Method binary_search: ability to find values in an array" => sub {
    my $obj = Search->new();

    my @tests = (
        {
            result => 0,
            target => 2,
            array => [qw/ 4 5 6 7 8 /],
        },
        {
            result => 0,
            target => 15,
            array => [qw/ 4 5 6 7 8 /],
        },
        {
            result => 0,
            target => 11,
            array => [qw/ 4 5 6 7 8 10 20 /],
        },
        {
            result => 1,
            target => 4,
            array => [qw/ 1 2 3 4 5 6 7 8 /],
        },
        {
            result => 1,
            target => 1,
            array => [qw/ 1 1 4 5 5 7 9 17 /],
        },
        {
            result => 1,
            target => 17,
            array => [qw/ 1 1 4 5 5 7 9 17 /],
        },
        {
            result => 1,
            target => 7,
            array => [qw/ 1 1 4 5 5 7 9 17 /],
        },
    );

    for my $test ( @tests ) {
        my $result = 
            ( $obj->binary_search( $test->{array}, $test->{target} ) ? 1 : 0 );

        cmp_ok(
            $result, '==', $test->{result},
            "Expected result for '" . $test->{target}
            . "' value in '" . join( ',', @{$test->{array}} ) . "' array"
        );

    }
};

done_testing();
exit();