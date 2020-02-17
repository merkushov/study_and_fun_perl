#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my %d = (
    '(' => ')',
    '{' => '}',
    '[' => ']',
);
my %dr = reverse %d;

sub validate_nested_brackets {
    my $str = shift;

    return 0 unless $str;

    my @b = ();
    while ( my $char = substr( $str, 0, 1, '' ) ) {
        if ( $d{ $char } ) {
            push @b, $char;
        }
        elsif ( $dr{ $char } ) {
            if ( $b[-1] && $b[-1] eq $dr{ $char } ) {
                pop( @b );
            }
            else {
                return 0;
            }
        }
    }

    return scalar( @b ) ? 0 : 1;
}

if ( my $str = $ARGV[0] ) {
    chomp($str);

    printf "%s\n", validate_nested_brackets( $str ) ? 'YES' : 'NO';

    exit(0);
}

# It is necessary here in order to use the script in autotests.
# Do not do this in big software!
1;

=pod

=encoding utf8

=head1 NAME

balance_brackets.pl

=head1 DESCRIPTION

Given n strings of brackets, determine whether each sequence of 
brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.

A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].

=head1 USAGE

    perl ./balanced_brackets.pl "([])"

=head1 AUTHOR

Victor Merkushov

=cut