use Lingua::EN::Words2Nums qw(words2nums);

my $number;
my $number_text;
my @number_list;
my %number_texts;

# read text from input
while (<>) {
    last unless /\S/;

    $number_text = $_;

    #translate the number string into text    
    $number = words2nums($number_text);

    #save both the translated number and the text in the hash.
    $number_texts{$number} = $number_text;

    #save the number in the number list to order later.
    push(@number_list, $number);
}


#sort the list. 
my @sorted_numbers = sort {$b <=> $a} @number_list;

print STDOUT "\n\n sorted list is : \n\n";

#display the texts using the hash table.
for my $sorted_number (@sorted_numbers) {

    $number_text = $number_texts{$sorted_number};
    print STDOUT $number_text;
}
