use strict;
use warnings;
use bignum try => 'GMP';

use lib 'lib';
use lib 't/lib';

use TestHelper;
use Test::More;
BEGIN { use_ok 'Factorial::TrivialWithRecursion' }

subtest "Init and simple check" => 
    \&TestHelper::simple_check,
    Factorial::TrivialWithRecursion->new();

subtest "Check out some calculation results" =>
    \&TestHelper::check_calculation_result,
    Factorial::TrivialWithRecursion->new();

done_testing();
exit(0);