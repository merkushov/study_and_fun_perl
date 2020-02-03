package Factorial::TrivialCPP;

# use Data::Dumper;

use strict;
use warnings;

use Inline ( CPP => 'DATA' => 
    libs => [ '-lgmp', '-lgmpxx' ],
    ccflags => [ '-lgmp', '-lgmpxx' ],
);
 
sub new { bless {}, shift }

sub calculate {
    my ( $self, $num ) = @_;

    return unless defined $num && $num >= 0;

    return factorial( $num );
}
 
1;

__DATA__
__CPP__

#include "gmp.h"

char * factorial(int n){
    int i;
    mpz_t p;

    mpz_init_set_ui(p,1);
    for (i=1; i <= n ; ++i){
        mpz_mul_ui(p,p,i);
    }

    char *a_out = mpz_get_str(NULL, 10, p);
    mpz_clear(p);

    return a_out;
}