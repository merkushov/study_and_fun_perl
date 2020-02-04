package Factorial;

use strict;
use warnings;

use lib 'lib';
use Factorial::TrivialCPP;
use Factorial::Trivial;
use Factorial::Tree;
use Factorial::TrivialWithRecursion;

sub new {
    my $class = shift;

    my $self = {
        _class_map => {
            trivial             => 'Factorial::Trivial',
            trivial_cpp         => 'Factorial::TrivialCPP',
            trivial_recursion   => 'Factorial::TrivialWithRecursion',
            tree                => 'Factorial::Tree',
        },
        _obj_map => {},
    };

    return bless( $self, $class );
}

sub get_all_types { [ keys %{shift->{_class_map}} ] }

sub type {
    my ( $self, $name ) = @_;

    unless ( $name && $self->{_class_map}->{$name} ) {
        warn "Invalid algorithm name";
        return;
    }

    unless ( $self->{_obj_map}->{$name} ) {
        $self->{_obj_map}->{$name} = $self->{_class_map}->{$name}->new();
    }

    return $self->{_obj_map}->{$name};
}

1;