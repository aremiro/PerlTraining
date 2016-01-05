use strict;
use Data::Dumper;

my $origin_node;
my $dest_node;
my $path_begin;
my $path_end;
my %nodes;
my $filename = $ARGV[0];
my @distances_data;
my @priority_queue;

sub build_node {

  my $node_id = $_[0];

  my $node = {
    id  => $node_id,
    adjacents => []
  };


  return $node;
}

sub build_node_distance_data {

  my $node_id = $_[0];

  my $dist_data = {
    id  => $node_id,
    father => '',
    distance => 999999,
    viewed => 0,
    enqueued => 0
  };

  return $dist_data;

}

sub show_node {
  my $node = $_[0];
  print " id: $node->{id}    distance: $node->{distance} ";
  foreach my $adj (@{$node->{adjacents}}) {
     print " $adj , ";
  } 
  print "\n";
}



sub get_distance_data_for_node {
  my (my $node_id, my @distances_data) = @_;

  foreach my $dist_data (@distances_data){

	if ($dist_data->{id} == $node_id) {
	  return \$dist_data;
	}
  }

}

sub enqueue {
  my $node_data = $_[0];
  my $queueref = $_[1];

  my @queue = @{$queueref};

  if (@{$queueref}) {
	my $index = 0;

	for $index (0 .. $#{$queueref}) {
		my $node_at_i = ${$queueref}[$index];
		if (${$node_data}->{distance} >= ${$node_at_i}->{distance}) {
			last;
		}
	}


	splice @{$queueref}, $index, 0, $node_data;

  } else {
	push (@{$queueref}, $node_data);
  }

  #print queue just for debug.
  foreach my $nd (@{$queueref}) {
	print " ${$nd}->{id}" . "/" . "${$nd}->{distance} \n";
  }

}

sub calculate_distances {
  (my $path_begin, my $distances_data, my $queue) = @_;

  my $node;
  my $adjacent;
  my $dist_data_adj;

  my $dist_data = get_distance_data_for_node($path_begin, @distances_data);
  ${$dist_data}->{distance} = 0;
  enqueue($dist_data, $queue);

  while (@{$queue}) {
     $dist_data = pop @{$queue};
     ${$dist_data}->{viewed} = 1;
     $node = $nodes{${$dist_data}->{id}};

     foreach $adjacent ( @{$node->{adjacents}}) {
	$dist_data_adj = get_distance_data_for_node($adjacent, @distances_data);
	if ( (not ${$dist_data_adj}->{viewed}) && (${$dist_data_adj}->{distance} > (${$dist_data}->{distance} + 1)) ) {
	  ${$dist_data_adj}->{distance} = ${$dist_data}->{distance} + 1;
          ${$dist_data_adj}->{father} = ${$dist_data}->{id};
	  enqueue($dist_data_adj, $queue);
	}
     }     
  }

}

open(my $fh, '<:encoding(UTF-8)', $filename);

my $first_row = 1;

while (my $row = <$fh>) {
  chomp $row;

  if (not $first_row) {
	 ($origin_node, $dest_node) = split(' ', $row);

	  my $node;

	  if (not defined $nodes{$origin_node}) {
		$node = build_node($origin_node);
                push(@distances_data, build_node_distance_data($origin_node));
		$nodes{$origin_node} = $node;
	  } else {
		$node = $nodes{$origin_node};

	  }

	  push($node->{adjacents}, $dest_node);

  } else {  #first row
	 ($path_begin, $path_end) = split(' ', $row);
	 $first_row = 0;
  }

}

calculate_distances($path_begin, \@distances_data, \@priority_queue);

print Dumper(\@distances_data);

