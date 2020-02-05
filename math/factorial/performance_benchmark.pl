use strict;
use warnings;
use bignum try => 'GMP';

use Benchmark qw/cmpthese timethese/;
use lib 'lib';

use Factorial;

my $num = 500;
my $obj = Factorial->new();

# timethese(-10, {
#     "Trivial (c++)"     
#         => sub{ $obj->type('trivial_cpp')->calculate($num) },
#     "Trivial (perl)"
#         => sub{ $obj->type('trivial')->calculate($num) },
#     "Trivial+recursion (perl)"
#         => sub{ $obj->type('trivial_recursion')->calculate($num) },
#     "Tree (perl)"
#         => sub{ $obj->type('tree')->calculate($num) },
# });

cmpthese( 1000, {
    "Trivial (c++)"     
        => sub{ $obj->type('trivial_cpp')->calculate($num) },
    "Trivial (perl)"
        => sub{ $obj->type('trivial')->calculate($num) },
    "Trivial+recursion (perl)"
        => sub{ $obj->type('trivial_recursion')->calculate($num) },
    "Tree (perl)"
        => sub{ $obj->type('tree')->calculate($num) },
});

exit(0);