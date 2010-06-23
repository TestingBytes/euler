#By listing the first six prime numbers: 2, 3, 5, 7, 11,
#and 13, we can see that the 6th prime is 13.
#What is the 10001st prime number?

use Benchmark;
$t0 = new Benchmark;

$count = 0;
for $num(1...1000000000)
{
	if(isPrime($num)){
		$count++;
	}
	
	if($count == 10001){
		print "$count: $num - done\n";
		last;
	}
}

$t1 = new Benchmark;
$td = timediff( $t1, $t0 );
print "the code took:", timestr($td), "\n";
exit;

sub isPrime {
    $number = $_[0];

	if ($number == 1) {
		return 0;
	}

    #if number is less than 3 - prime
    if ( $number < 3 ) {
        return 1;
    }

    #if even, not prime
    if ( $number % 2 == 0 ) {
        return 0;
    }

    for ( $i = 3 ; $i < $number ; $i += 2 ) {
        if ( $number != $i ) {
            if ( $number % $i == 0 ) {
                return 0;
            }
        }
    }

    return 1;
}
