#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

# dynamic regular expression for parenthesis validation
my $regex;
$regex = qr/ (?:[^()]+ | \( (??{ $regex }) \) )* /x;
# $regex = qr/ (?:[^()\[\]\{\}]+ | (?:\(|\[|\{) (??{ $regex }) (?:\)|\]|\}) )* /x;

sub validate_nested_brackets {
    if ( $_[0] =~ m/($regex)/ ) {
        warn $1;
        return $1 ? 1 : 0;
    }
    return 0;
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

DEPRECATED:
    
    Raw code

WARNING:

    In large samples, this error may occur:
    Complex regular subexpression recursion limit (32766) exceeded.

Given n strings of brackets, determine whether each sequence of 
brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.

A bracket is considered to be any one of the following characters: (, ).

=head1 USAGE

    perl ./balanced_brackets.pl "()"

=head1 AUTHOR

Victor Merkushov

=cut