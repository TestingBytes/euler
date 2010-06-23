use bigint;

my $number = 2**1000;

my @array = split(//,$number);

my $sum=0;
foreach(@array) {
	$sum+=$_;
}

print $sum."\n";