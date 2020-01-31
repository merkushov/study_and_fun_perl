#!/usr/bin/perl

use strict;
use warnings;

my %d = (
    '(' => ')',
    '{' => '}',
    '[' => ']',
);
my %dr = reverse %d;

while ( my $str = <STDIN> ) {
    chomp($str);

    my @a = split //, $str;

    last unless scalar @a;

    my @b = ();
    while ( my $char = shift @a ) {
        if ( $d{ $char } ) {
            push @b, $char;
        }
        elsif ( $dr{ $char } ) {
            pop( @b ) if $b[-1] eq $dr{ $char };
        }
    }

    printf "%s\n", scalar( @b ) ? 'NO' : 'YES';
}

=pod

=encoding utf8

=head1 NAME

balance_brackets.pl

=head1 DESCRIPTION

Given n strings of brackets, determine whether each sequence of 
brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.

A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].

=head1 USAGE

    perl ./balanced_brackets.pl
    or
    cat input.dat | perl ./balanced_brackets.pl

=head1 AUTHOR

Victor Merkushov

=cut