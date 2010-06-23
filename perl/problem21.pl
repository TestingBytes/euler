use strict;

sub getDivisors($) {
	
	my $value = $_[0];
	my @divisors = ();
	
	for (1 .. $value-1) {
		if($value%$_==0) {
			push @divisors,$_;
		}
	}
	
	@divisors;
	
}

sub getDivisorSum($) {
	
	my $value = $_[0];
	
	my @divisors = getDivisors($value);
	my $sum = 0;
	
	foreach(@divisors) { $sum+=$_; }
	
	$sum;
}

my $totalSum = 0;

for (1 .. 10000 ) {
	
	my $sum = getDivisorSum($_);
	
	if( (getDivisorSum($sum) == $_) && ($sum != $_) ) {
		$totalSum += $_;
		print "$_\td($_)=$sum\n";
	}

}
	print "Sum: $totalSum\n";