#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Test::More;

my %all_subs = ();
while ( my ( $name, $content ) = each %main:: ) {
    if ( ref $content eq 'CODE' ) {
        $all_subs{$name} = $content;
    }
}

my $example_number = undef;
if ( $ARGV[0] && $ARGV[0] =~ m/^\d+$/ ) {
    $example_number = $ARGV[0];
}

sub ex1 {
    my ( $original_text, $text );

    diag 'Delete words containing duplicate characters qr/\b\w*(\w)\1\w*\b/';

    $original_text = $text = 'Leading health experts from around the world have'
        . ' been meeting at the World Health Organization’s Geneva headquarters'
        . ' to assess the current level of knowledge about the new COVID-19'
        . ' disease, identify gaps and work together to accelerate and fund'
        . ' priority research needed to help stop this outbreak and prepare for'
        . ' any future outbreaks.';

    $text =~ s/\b\w*(\w)\1\w*\b//g;

    # warn $text;

    isnt( $original_text, $text, "the text has changed" );
    unlike(
        $text,
        qr/assess|current|needed/,
        "no words with repeated characters, like assess, current or needed"
    );
}

subtest "Call examples" => sub {
    if ( defined $example_number ) {
        eval {
            no strict 'refs';

            my $sub_name = 'ex' . $example_number;
            $sub_name->();
        };
        warn $@ if $@;
    }
    else {

        for my $sub_name ( keys %all_subs ) {
            eval {
                no strict 'refs';

                $all_subs{$sub_name}->();
            };
            warn $@ if $@;
        }
    }
};

done_testing();
exit(0);