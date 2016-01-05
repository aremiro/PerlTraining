package Square; 

our @ISA = qw(Rectangle);

sub new { 
	 my ($class) = @_;
	 my $self = $class->SUPER::new( $_[1], $_[2], $_[3], $_[4] );

	 bless $self, $class; 
	 return $self; 
}

sub setTopLeft {
	 my ( $self, _topLeft) = @_;
	 $self->{_topLeft} = $topLeft if defined $topLeft; 
	 return $self._topLeft; 
}

sub setTopRight {
	 my ( $self, _topRight) = @_;
	 $self->{_topRight} = $topRight if defined $topRight; 
	 return $self._topRight; 
}

sub setBottomLeft {
	 my ( $self, _bottomLeft) = @_;
	 $self->{_bottomLeft} = $bottomLeft if defined $bottomLeft; 
	 return $self._bottomLeft; 
}

sub setBottomRight {
	 my ( $self, _bottomRight) = @_;
	 $self->{_bottomRight} = $bottomRight if defined $bottomRight; 
	 return $self._bottomRight; 
}


1;
