package Square; 

our @ISA = qw(Rectangle);

sub new { 
	 my ($class) = @_;
	 my $self = $class->SUPER::new( $_[1], $_[2], $_[3], $_[4] );

	 bless $self, $class; 
	 return $self; 
}


1;
