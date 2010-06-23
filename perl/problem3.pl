#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?
use Benchmark;
$t0 = new Benchmark;

$test = 600851475143;
#$test = $test/2;
#$test = sqrt($test);
#$test =~ m/(^\S+)\./;
#$test = $1+1;

for($j=1; $j<$test; $j++) {
	if( isPrime($j) ) {
		if( ($test % $j) == 0) {
			print "$j \n";
			$|++;
		}
	}
}
$t1 = new Benchmark;
$td = timediff($t1,$t0);
print "the code took:",timestr($td),"\n";
exit;

sub isPrime {	
	$number = $_[0];
	
	#if number is less than 3 - prime
	if($number < 3) {
		return 1;
	}
	
	#if even, not prime
	if( $number % 2 == 0) {
		return 0;
	}
	
	for($i=3; $i<$number; $i+=2){
		if($number != $i){
			if($number % $i == 0) {
				return 0;
			}	
		}
	}
	
	return 1;
}