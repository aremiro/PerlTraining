use Switch;
use Figures::Figure;
use Figures::Rectangle;
use Figures::CoordinatePoint;
use Data::Dumper;
use Cairo;
use warnings;
use Term::ANSIScreen qw(cls);
use strict;


my %figure_options = ( 1 => "Rectangle" , 2 => "Square" , 3 => "Triangle" , 4 => "Circle" );

sub resetScreen {
	my $clear_screen = cls();
	print $clear_screen;
}

sub readCoordinatePoint {

	print "X coordinate : ";
  	my $x = <STDIN>;
	print "Y coordinate : ";
  	my $y = <STDIN>;
  	chomp($x);
  	chomp($y);

	my $cp = new CoordinatePoint($x, $y);

	return $cp;
}

sub readFourPoints {
	print "Enter value for top left : \n";
	my $topLeft = readCoordinatePoint;
	resetScreen;
	my $coordinateString = "top left = ($topLeft->{_x},$topLeft->{_y})"; 
	print $coordinateString . "\nEnter value for top right : \n";
	my $topRight = readCoordinatePoint;
	resetScreen;
 	$coordinateString = $coordinateString . ", top right = ($topRight->{_x},$topRight->{_y})"; 
	print $coordinateString . "\nEnter value for botton left : \n";
	my $bottomLeft = readCoordinatePoint;
	resetScreen;
 	$coordinateString = $coordinateString . ", bottom left = ($bottomLeft->{_x},$bottomLeft->{_y})"; 
	print $coordinateString . "\nEnter value for bottom right : \n";
	my $bottomRight = readCoordinatePoint;
	resetScreen;
	$coordinateString = $coordinateString . ", bottom right = ($bottomRight->{_x},$bottomRight->{_y})"; 


	return ($topLeft,$topRight,$bottomLeft,$bottomRight);
}


sub readFigure {

  my $outputfile = "out.png";

  print "Select which figure to draw \n  (1) Rectangle\n  (2) Square\n  (3) Triangle\n  (4) Circle\n\n";

  my $option = <STDIN>;
  chomp $option;

  print Dumper(\$option);
  resetScreen;
  if ( exists($figure_options{$option}) ){

  	my $figure;

	switch ($option) {
		case 1		{ 
			my ($tl, $tr, $bl, $br) = readFourPoints;
			$figure = new Rectangle($tl, $tr, $bl, $br);
		}

		else		{ print "previous case not true" }
	}

	$figure->draw($outputfile);

  	return 0;
  } else {

  	return 1;
  }

}





resetScreen;

my $stop = 0;

while (not $stop) {

	$stop = readFigure;

#    last unless /\S/;

}


my $surface = Cairo::ImageSurface->create ('argb32', 100, 100);
my $cr = Cairo::Context->create ($surface);
 
$cr->rectangle (10, 10, 40, 40);
$cr->set_source_rgb (0, 0, 0);
$cr->fill;
 
$cr->rectangle (50, 50, 40, 40);
$cr->set_source_rgb (1, 1, 1);
$cr->fill;
 
$cr->show_page;
 
#$surface->write_to_png ('output.png');

