#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#Find the sum of all the primes below two million.

my $sum    = 0;
my @Primes = ();

for $number ( 2 ... 2000000 ) {
    if ( isPrime($number) ) {
        $sum += $number;

    }
    if ( $number % 100000 == 0 ) {
        print "$number: $sum\n";
$|++;
    }

}

print "final sum = " . $sum;

sub isPrime {
    $number = $_[0];

    #if number is less than 3 - prime
    if ( $number < 3 ) {
        push( @Primes, $number );
        return 1;
    }

    foreach $prime (@Primes) {
        if ( $number % $prime == 0 ) {
            return 0;
        }
    }

    push( @Primes, $number );
    return 1;
}
