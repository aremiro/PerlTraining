use strict;

my $numQty = $ARGV[0];
my @primeNumbers = ();


if ($numQty == 1) {
  print STDOUT "There are no prime numbers \n";
  exit 0;
}

my $isPrime;

foreach my $number (2 .. $numQty) {

  $isPrime = 1;

  foreach my $primeNumber (@primeNumbers) {

    my $modulus = ($number % $primeNumber);
    if ($modulus == 0) {
	$isPrime = 0;
	last;
    }

  }

  if ($isPrime) {
    print STDOUT " $number ";
    push(@primeNumbers, $number);
  }

}

print STDOUT " \n ";





