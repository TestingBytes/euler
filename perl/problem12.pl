use strict;

use Benchmark::Timer;
my $maxDivisors = 0;

sub CountDivisors($) {
	my $number = $_[0];
	my $count = 0;

	my $root = int sqrt $number;
	
	for(my $i=1; $i <= $root; $i++) {
		if( $number % $i == 0) {
			$count+=2;
		}
	}
	
	if( $count > $maxDivisors ) {
		$maxDivisors =$count;
		print "$number: $maxDivisors Divisors\n";
	}
}

sub main() {
	my $number = 0;
	for(my $i=1; $i<100000; $i++) {
	
		$number += $i;
		
		if($number > 0) {
			CountDivisors($number);
		}
		
		if($maxDivisors > 500) { last; }
	}
}

### main

my $t = Benchmark::Timer->new(skip=>0);

for(1 .. 1) {
	$t->start('tag');
	main();
	$t->stop('tag');
}
print $t->report."\n";

exit;







