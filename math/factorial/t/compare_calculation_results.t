use strict;
use warnings;
use bignum try => 'GMP';

use lib 'lib';
use lib 't/lib';

use TestHelper;
use Test::More;

use Factorial::Trivial;
use Factorial::TrivialCPP;
use Factorial::Tree;

subtest "Comparing the results of all algorithms with each other" => sub {
    my $obj1 = Factorial::Trivial->new();
    my $obj2 = Factorial::TrivialCPP->new();
    my $obj3 = Factorial::Tree->new();

    my $map = TestHelper::config()->{factorial_example};
    for my $k ( sort { $a <=> $b } keys %{$map} ) {

        my $result1 = $obj1->calculate( $k );
        my $result2 = $obj2->calculate( $k );
        my $result3 = $obj3->calculate( $k );

        cmp_ok(
            $result1, '==', $result2,
            "Factorial $k: " . ref($obj1) . " == " . ref($obj2)
        );
        cmp_ok(
            $result2, '==', $result3,
            "Factorial $k: " . ref($obj2) . " == " . ref($obj3)
        );
    }
};

done_testing();
exit(0);