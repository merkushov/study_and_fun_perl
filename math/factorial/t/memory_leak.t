use strict;
use warnings;

use Memory::Usage;
use Test::More;

use lib 'lib';
use Factorial;

my %cycle_count = (
    default => 100_000,
    tree    => 1_000,
);

unless ( $ARGV[0] && $ARGV[0] eq 'manual' ) {
    plan skip_all => 'use "manual mode" to run this test';
}

my $manual_type;
if ( $ARGV[1] ) {
    $manual_type = $ARGV[1];
}

subtest "Check memory" => sub {
    my $obj = Factorial->new();

    for my $alg_type ( sort { $a cmp $b } @{$obj->get_all_types()} ) {
        next if $manual_type && $alg_type ne $manual_type;

        my $cycles = $cycle_count{$alg_type} || $cycle_count{default};

        # in order to keep abreast of what is happening
        ok( $alg_type, "Check '$alg_type' (cycles $cycles)" );

        my $mu = Memory::Usage->new();
        $mu->record('BEGIN');

        # Long cycle. Because there is only math, then as a result
        # there should not be big changes in memory usage
        for ( 1..$cycles ) {
            my $result = $obj->type($alg_type)->calculate( int(rand(50)) + 50 );
        }

        $mu->record('END');

        print $mu->report(), $/;

        my $mu_state = $mu->state();
        cmp_ok $mu_state->[-1]->[-1] - $mu_state->[0]->[-1], '<=', 100,
            "No more than 100 KB of memory was used for the data";
    }
};

done_testing();
exit();