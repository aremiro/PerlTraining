package CoordinatePoint;

sub new{
	my $class = shift;
	my $self = {
		_x => shift,
		_y => shift
	};

        print " x is $self->{_x} , y is $self->{_y} \n";

	bless $self, $class;
	return $self;
}


sub setX {
	my ( $self, $x ) = @_;
	$self->{_x} = $x if defined $x;
	return $self._x;
}

sub setY {
	my ( $self, $y) = @_;
	$self->{_y} = $y if defined $y;
	return $self._y;
}

1;


