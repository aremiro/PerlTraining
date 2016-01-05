package Rectangle;

our @ISA = qw(Figure);

sub new {
		my $class = shift;
		my $self = {
			_topLeft => shift,
			_topRight => shift,
			_bottomLeft => shift,
			_bottomRight => shift
		};
		
		bless $self, $class;
		return $self;
}

sub setTopLeft {
		my ( $self, $topLeft ) = @_;
		$self->{_topLeft} = $topLeft if defined $topLeft;
		return $self._topLeft;
}

sub setTopRight {
		my ( $self, $topRight ) = @_;
		$self->{_topRight} = $topRight if defined $topRight;
		return $self._topRight;
}

sub setBottomLeft {
		my ( $self, $bottomLeft ) = @_;
		$self->{_bottomLeft} = $bottomLeft if defined $bottomLeft;
		return $self._bottomLeft;
}

sub setBottomRight {
		my ( $self, $bottomRight ) = @_;
		$self->{_bottomRight} = $bottomRight if defined $bottomRight;
		return $self._bottomRight;
}

sub isConsistent {
	if (not ( defined $self->{_topLeft} && defined $self->{_topRight} && defined $self->{_bottomLeft} && defined $self->{_bottomRight} ) ) {
		return 0;
	} 
	if (not ($self->{_topLeft}->{_y} == $self->{_topRight}->{_y})) {
		return 0;
	}

	if (not ($self->{_bottomLeft}->{_y} == $self->{_bottomRight}->{_y})) {
		return 0;
	}
	return 1;
}

sub draw {
	my ($self, $filename) = @_;
	print "filename is {$filename} ";

	my $width = $self->{_topRight}->{_x} - $self->{_topLeft}->{_x};
	my $height = $self->{_topRight}->{_y} - $self->{bottomRight}->{_y};
	my $x = $self->{_topLeft}->{_x};
	my $y = $self->{_topLeft}->{_y};

	print " ( $x, $y, $width, $height ) \n";

	my $surface = Cairo::ImageSurface->create ('argb32', 100, 100);
	my $cr = Cairo::Context->create ($surface);

	$cr->rectangle ($x, $y, $width, $height);
	$cr->set_source_rgb (0, 0, 0);
	$cr->fill;

	$cr->show_page;
	$surface->write_to_png ($filename);


}
