use strict;
use warnings;
use bignum try => 'GMP';

use Benchmark qw/cmpthese timethese/;
use lib 'lib';

use Factorial::TrivialCPP;
use Factorial::Trivial;
use Factorial::Tree;

my $obj1 = Factorial::TrivialCPP->new();
my $obj2 = Factorial::Trivial->new();
my $obj3 = Factorial::Tree->new();

my $num = 500;

# timethese(-10, {
#     "Trivial (c++)"     => sub{ $obj1->calculate($num) },
#     "Trivial (perl)"    => sub{ $obj2->calculate($num) },
#     "Tree (perl)"       => sub{ $obj3->calculate($num) },
# });

cmpthese( -10, {
    "Trivial (c++)"     => sub{ $obj1->calculate($num) },
    "Trivial (perl)"    => sub{ $obj2->calculate($num) },
    "Tree (perl)"       => sub{ $obj3->calculate($num) },
});

exit(0);