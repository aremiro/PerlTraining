# quadratic formula ax2+bx+c

$numArgs = $#ARGV + 1;

if ($numArgs < 3) {
 print STDERR "too few arguments \n"; 
 exit 0;
}

my $a = $ARGV[0];
my $b = $ARGV[1];
my $c = $ARGV[2];

print STDOUT "Function is ${a}xx + ${b}x + $c  \n";

my $rootDeterminator = $b**2 - 4*$a*$c;

if ($rootDeterminator < 0) {

  print STDOUT "there are no roots \n";
  exit 0;
} 

if ($rootDeterminator == 0) {

  $uniqueRoot = -$b/(2*$a);

  print STDOUT "Unique root is $uniqueRoot   \n";
  exit 0;

} 

my $x1 = ((-$b) + sqrt($rootDeterminator))/(2*$a);
my $x2 = ((-$b) - sqrt($rootDeterminator))/(2*$a);

print STDOUT "root values are $x1 and $x2 \n";

