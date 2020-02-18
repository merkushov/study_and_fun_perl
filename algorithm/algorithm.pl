#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use lib 'lib';
use Search;


my $string = <STDIN>;

my @array = split( /\s/, $string);

my $num = shift @array;
# warn Dumper(\@array);

my $search = Search->new();
my $result = $search->binary_search( \@array, $num );

print $result ? $result : 'no match', $/;

exit(0);

=pod

=encoding utf8

=head1 NAME

algorithm.pl

=head1 DESCRIPTION



=head1 USAGE

    echo "7 1 2 3 4 5 6 7 8 9" | perl ./balanced_brackets.pl

=head1 AUTHOR

Victor Merkushov

=cut