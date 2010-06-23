use strict;
use bigint;
my $oldNumber = 1;
my $currentNumber = 1;
my $nextNumber = 0;
my $term = 2;
my $test = 100;

while(length($currentNumber)<1001) {
	
	print "$term. CurrentNumber = $currentNumber\t[Length] ".length($currentNumber)."\n";
	$nextNumber = $currentNumber + $oldNumber;
	
	$oldNumber = $currentNumber;
	$currentNumber = $nextNumber;
	$term++;
	#if( length($currentNumber) == 1000) { exit; }
}