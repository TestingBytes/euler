#A palindromic number reads the same both ways. The largest
#palindrome made from the product of two 2-digit numbers is
#9009 = 91  99.

#Find the largest palindrome made from the product of two
#3-digit numbers.

#$i=1;
#$number = 1234;
#print substr($number,$i,1);
#print substr($number,length($number)-($i+1),1);
#exit;

my %palindromes = ();

for ( $i = 1 ; $i <= 999 ; $i++ ) {
    for ( $j = 1 ; $j <= 999 ; $j++ ) {
        $result = $i * $j;

        if ( !$palindromes{"$result"} ) {
            if ( isPalindrome($result) ) {
                $palindromes{"$result"} = 1;
                #print "$result\n";
                #$|++;
            }
        }
    }
}

$largest = 0;
foreach $key (keys %palindromes) {
	if($key > $largest){$largest=$key;}
}
	print $largest;
	
sub isPalindrome {
    $number = $_[0];
    $length = length($number);

    if ( ($length<2) || ($length % 2 != 0) ) {
        return 0;
    }

    for ( $k = 0 ; $k < $length / 2 ; $k++ ) {
        $c1 = substr( $number, $k, 1 );
        $c2 = substr( $number, $length - ( $k + 1 ), 1 );

        if ( $c1 ne $c2 ) {
            return 0;
        }
    }

    return 1;
}
