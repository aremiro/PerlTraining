
print STDOUT "Please, enter 1 line of text:\n";
my $text = <STDIN>;


my $replacecommand;
my $key;
my $replace;
my %replacementsMap;
my @replacementsList;


print STDOUT "Please, enter space separated strings to match and replace (one pair per line).\n";
print STDOUT "Empty line will interrupt input and start execution:\n";

while (<>) {
    last unless /\S/;

    $replacecommand = $_;

    ($key, $replace) = split(' ', $replacecommand);


    $replacementsMap{$key} = $replace;
    push(@replacementsList, $key);

}


foreach my $key (@replacementsList) {

  $text =~ s/$key/$replacementsMap{$key}/g;

}



print STDOUT $text . "\n";

