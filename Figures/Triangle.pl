package Triangle; 

our @ISA = qw(Figure);

sub new { 
	 my $class = shift; 
	 my $self = { 
		 _firstPoint => shift,
		 _secondPoint => shift
		 _thirdPoint => shift,
	 }; 

	 bless $self, $class; 
	 return $self; 
}

sub setFirstPoint {
	 my ( $self, _firstPoint) = @_;
	 $self->{_firstPoint} = $firstPoint if defined $firstPoint; 
	 return $self._firstPoint; 
}

sub setSecondPoint {
	 my ( $self, _secondPoint) = @_;
	 $self->{_secondPoint} = $secondPoint if defined $secondPoint; 
	 return $self._secondPoint; 
}

sub setThirdPoint {
	 my ( $self, _thirdPoint) = @_;
	 $self->{_thirdPoint} = $thirdPoint if defined $thirdPoint; 
	 return $self._thirdPoint; 
}


1;
