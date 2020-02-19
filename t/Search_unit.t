#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Test::More;
use lib 'algorithm/lib';
use lib 't/lib';
use TestHelper;

BEGIN { use_ok 'Search' }

my $t_helper = TestHelper->new();

subtest "Init object" => sub {
    my $obj = Search->new();

    ok $obj, "A new object has been defined";
    cmp_ok ref $obj, 'eq', 'Search', "The type of the new object is 'Search'";
};

sub check_return_values {
    my $method_name = shift;

    my $obj = Search->new();

    ok $obj->can($method_name), "The object has an '$method_name' method";

    my $defined_position = $obj->$method_name( [qw/ 1 2 3 4 5 /], 2 );
    ok defined $defined_position,
        "For an existing value, the method returned a defined result";
    cmp_ok $defined_position, '==', 1, "The expected result returned";

    my $undefined_position = $obj->$method_name( [qw/ 1 2 3 4 5 /], 9 );
    ok ! defined $undefined_position, 
        "For an unexisting value, the method returned a undefined result";
}

sub check_value_search {
    my $method_name = shift;

    my $obj = Search->new();

    ok $obj->can($method_name), "The object has an '$method_name' method";

    my $search_tests = $t_helper->get_jsonl_data( 'ordered_arrays.jsonl' );

    for my $test ( @{$search_tests} ) {
        my $result = (
            defined $obj->$method_name( $test->{array}, $test->{target} )
                ? 1
                : 0
        );

        cmp_ok(
            $result, '==', $test->{result},
            "Expected result for '" . $test->{target}
            . "' value in '" . join( ',', @{$test->{array}} ) . "' array"
        );

    }
}

subtest "Method binary_search: Checking Return Values" =>
    \&check_return_values, 'binary_search';

subtest "Method binary_search: ability to find values in an array" =>
    \&check_value_search, 'binary_search';

subtest "Method linear_search: Checking Return Values" =>
    \&check_return_values, 'linear_search';

subtest "Method linear_search: ability to find values in an array" =>
    \&check_value_search, 'linear_search';

done_testing();
exit();