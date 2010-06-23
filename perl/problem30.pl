use strict;
use Data::Dumper;

my $sum = 0;

for(9 .. 100000000) {
	my @digits = split(//,$_);
	#print Dumper(\@digits);
	my $buffer = "";
	
	$buffer ="$buffer"."$_: ";
	
	my $fifthSum = 0;
	for my $i (0 .. scalar @digits-1) {
		$buffer ="$buffer"."$digits[$i]^5";
		
		if($i != scalar @digits-1) {
			$buffer ="$buffer"." + ";
		}
		
		$fifthSum += $digits[$i]**5;
	}
	
	$buffer ="$buffer"." = $fifthSum";
	
	if($_ == $fifthSum) {
		print $buffer;
		$sum += $_;
		print "\tCurrentSum($sum)";
		print "\n";
	}
}

