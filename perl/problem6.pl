#The sum of the squares of the first ten natural numbers is,
#1^2 + 2^2 + ... + 10^2 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)^2 = 55^2 = 3025
#Hence the difference between the sum of the squares of the
#first ten natural numbers and the square of the sum is
#3025 - 385 = 2640.

#Find the difference between the sum of the squares of the
#first one hundred natural numbers and the square of the sum.

print "Difference for 10 = ".(SquareOfSums(10)-SumOfSquares(10))."\n";
print "Difference for 10 = ".(SquareOfSums(100)-SumOfSquares(100))."\n";


sub SquareOfSums {
    $n = $_[0];
    my $sum = 0;
    for $count ( 1 ... $n ) {
		$sum += $count;
    }
	
	$sum**2;
}

sub SumOfSquares {
    $n = $_[0];
    my $sum = 0;

    for $count ( 1 ... $n ) {
        $sum += $count**2;
    }

    $sum;
}
