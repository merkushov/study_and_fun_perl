use warnings;

# some quick and ugly solution to test a simple function in a simple script
# Do not do this in big software!
require './regex/balanced_brackets.pl';

use Test::More;
use Text::CSV qw( csv );

subtest "Parenthesis test" => sub {
    while ( my $str = <DATA> ) {
        chomp($str);

        my ( $valid, $task ) = split /\s/, $str;
        cmp_ok &validate_nested_brackets( $task ), '==', $valid,
            "Expected Result for '$task'";
    }
};

# subtest "Parenthesis test" => sub {
#     my $arr = csv( in => "./t/data/balanced_brackets.csv" );

#     for my $item ( @{$arr} ) {
#         my ( $valid, $task ) = @{$item};
#         cmp_ok &validate_nested_brackets( $task ), '==', $valid,
#             "Expected Result for '$task'";
#     }
# };

done_testing();
exit();

__DATA__
1 ()
1 (abc)
0 )(
0 )
0 (
1 (((())))
1 (()()())
0 )))(()()