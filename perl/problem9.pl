#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#a^(2) + b^(2) = c^(2)

#For example, 3^(2) + 4^(2) = 9 + 16 = 25 = 5^(2).

#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

$top = 1000;

for($a=1; $a<$top; $a++){
	for($b=$a+1; $b<$top; $b++){
		$sum = $a**2 + $b**2;
		$c = sqrt($sum);
		if( $c !~ m/\./ ){
			#print "Triplet: $a^2 + $b^2 = $sum  -- $a<$b<$c\n";
			if(($a+$b+$c) == 1000){
				print "Triplet found: $a $b $c\n";
				print "\nProduct:".$a*$b*$c."\n";
				exit;
			}
		}
	}
}

print "\na=$a b=$b c=$c\n";
