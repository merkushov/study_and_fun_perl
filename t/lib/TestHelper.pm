package TestHelper;

use strict;
use warnings;

use JSON::XS;

sub new { bless {}, shift }

sub get_jsonl_data {
    my ( $self, $filepath ) = @_;

    my $fullpath = './t/data/' . $filepath;

    my @array = ();

    open my $fh, "<", $fullpath or die "Can't open file '$fullpath': $!";
    while ( my $str = <$fh> ) {
        eval {
            push @array, decode_json( $str );
        };
        warn $@ if $@;
    }
    close( $fh );

    return \@array;
}

1;