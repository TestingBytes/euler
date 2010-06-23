#2520 is the smallest number that can be divided by each
#of the numbers from 1 to 10 without any remainder.

#What is the smallest number that is evenly divisible by
#all of the numbers from 1 to 20?

#1.78

use Benchmark;
$t0 = new Benchmark;

$value = 20;
$count=1;
while() {
	$divisor = $value*$count;
	 if ( test($divisor) ) {
	        print $divisor. "\n";
	        last;
	}
	$count=$count+1;
}

$t1 = new Benchmark;
$td = timediff( $t1, $t0 );
print "the code took:", timestr($td), "\n";
exit;

sub test {
    $number = $_[0];

    for ( $i = 19 ; $i > 10 ; $i-- ) {
        if ( $number % $i != 0 ) {
            return 0;
        }
    }

    return 1;
}
