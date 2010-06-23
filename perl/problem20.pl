use bigint;
use strict;

my $value = 1;

for(1 .. 100) { $value *= $_;}
print $value."\n";

my @values = split(//,$value);

my $sum = 0;
foreach (@values) { $sum+=$_;}
print "sum: $sum\n";



