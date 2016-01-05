package Circle; 

our @ISA = qw(Figure);

sub new { 
	 my $class = shift; 
	 my $self = { 
		 _center => shift,
		 _perimeterPoint => shift
	 }; 

	 bless $self, $class; 
	 return $self; 
}

sub setCenter {
	 my ( $self, _center) = @_;
	 $self->{_center} = $center if defined $center; 
	 return $self._center; 
}

sub setPerimeterPoint {
	 my ( $self, _perimeterPoint) = @_;
	 $self->{_perimeterPoint} = $perimeterPoint if defined $perimeterPoint; 
	 return $self._perimeterPoint; 
}


1;
