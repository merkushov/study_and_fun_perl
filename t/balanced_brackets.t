use warnings;

# some quick and ugly solution to test a simple function in a simple script
# Do not do this in big software!
require './data_structures/stack/balanced_brackets.pl';

use Test::More;
use Text::CSV qw( csv );

subtest "Parenthesis test" => sub {
    my $arr = csv( in => "./t/data/balanced_brackets.csv" );

    for my $item ( @{$arr} ) {
        my ( $valid, $task ) = @{$item};
        cmp_ok &validate_nested_brackets( $task ), '==', $valid,
            "Expected Result for '$task'";
    }
};

done_testing();
exit();