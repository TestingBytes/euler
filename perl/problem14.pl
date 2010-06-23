use strict;

# odd -> 3n+1
# enven -> n/2
my $MaxChainCount = 0;
for(my $i = 1000000; $i > 0; $i--) {
	my $number = $i;
	my $chainCount = 1;
	
	while($number != 1) {
		$chainCount++;
		
		if($number % 2 == 0) {
			$number /= 2;
		}
		else {
			$number = $number*3+1;
		}
	}
	
	if($chainCount > $MaxChainCount) {
		$MaxChainCount = $chainCount;
		print "$i: $MaxChainCount\n";
	}
}

exit;