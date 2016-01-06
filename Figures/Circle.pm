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
	 my ( $self, $center) = @_;
	 $self->{_center} = $center if defined $center; 
	 return $self._center; 
}

sub setPerimeterPoint {
	 my ( $self, $perimeterPoint) = @_;
	 $self->{_perimeterPoint} = $perimeterPoint if defined $perimeterPoint; 
	 return $self._perimeterPoint; 
}

sub draw {
	my ($self, $filename) = @_;

}


1;
