use strict;
use Lingua::EN::Nums2Words;

my $word;
my $number;

my $total = 0;

for(my $i=1; $i<1001; $i++){
    $word = &num2word($i);
    
    $word =~ s/\ //g;
    $word =~ s/-//g;
    
    my $length = length($word);


    if($i%100!=0 && $i>100) {
        print "Number: $i requires an \'and\'\n";
        $length+=3; #for 'and'
    }
    
    $total += $length;
    
    print "$i: $word : $length\n";
}

print "Total: $total\n";
