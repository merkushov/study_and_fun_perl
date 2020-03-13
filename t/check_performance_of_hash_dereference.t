use strict;
use warnings;

use Benchmark qw/cmpthese timethese/;
use Test::More;

unless ( $ARGV[0] && $ARGV[0] eq 'manual' ) {
    plan skip_all => 'use "manual mode" to run this test';
}

our $NUM_1 = 0;
our $NUM_2 = 0;
our %hash = ( num => 2 );

sub stacked_sigils {
    my $hash = shift;

    $NUM_1 = $$hash{'num'};

    return 1;
}

sub arrow_notation {
    my $hash = shift;

    $NUM_2 = $hash->{'num'};

    return 1;
}

for ( 1..10 ) {
    cmpthese( 5_000_000, {
        "01_stacked_sigils" => sub { &stacked_sigils( \%hash ) },
        "02_arrow_notation" => sub { &arrow_notation( \%hash ) },
    });
    $NUM_1 = 0;
    $NUM_2 = 0;
}

ok 1;

done_testing();
exit();