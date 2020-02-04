use strict;
use warnings;
use bignum try => 'GMP';

use lib 'lib';
use lib 't/lib';

use TestHelper;
use Test::More;

use Factorial;

subtest "Comparing the results of all algorithms with each other" => sub {
    my $obj = Factorial->new();

    my $types = $obj->get_all_types();

    ok $types && ref $types eq 'ARRAY' && scalar @{$types} > 2,
        "Got some types of algorithms";

    my $some_type = shift @{$types};

    my $map = TestHelper::config()->{factorial_example};
    for my $k ( sort { $a <=> $b } keys %{$map} ) {

        my $result_etalon = $obj->type( $some_type )->calculate( $k );

        for my $type ( @{$types} ) {
            my $result = $obj->type( $type )->calculate( $k );

            cmp_ok(
                $result_etalon, '==', $result,
                "Factorial $k: " . ref($obj->type($some_type))
                . " == " . ref($obj->type($type))
            );
        }
    }
};

done_testing();
exit(0);