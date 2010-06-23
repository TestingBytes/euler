#By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#
#
#Find the maximum total from top to bottom of the triangle below:
#
#
#NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

my @tree = (
[ 75],
[ 95, 64],
[ 17, 47, 82],
[ 18, 35, 87, 10],
[ 20, 4, 82, 47, 65],
[ 19, 1, 23, 75, 3, 34],
[ 88, 2, 77, 73, 7, 63, 67],
[ 99, 65, 4, 28, 6, 16, 70, 92],
[ 41, 41, 26, 56, 83, 40, 80, 70, 33],
[ 41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
[ 53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
[ 70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
[ 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
[ 63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
[ 04, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 04, 23],  
);
use strict;
use Data::Dumper;

sub printPaths($$@);
sub pathSum(@);

#my @tree =
#(
# [3],
# [7, 5],
# [2, 4, 6],
# [8, 5, 9, 3],
#);

my @paths = ();
my $depthLimit = scalar @tree;
my $maxSum = 0;

printPaths(0,0,\@paths);
exit;

sub pathSum(@) {
	my @path = @{$_[0]};
	
	my $sum = 0;
	
	foreach (@path) {
		$sum+= $_;
	}
	
	$sum;
}

sub printPaths($$@){
    my $depth = $_[0];
    my $index = $_[1];
    my @path = @{$_[2]};
    #print "Testing $depth,$index\n";
    #print Dumper(\@path);
    
    if( $depth+1 >= $depthLimit ) {  #scalar @tree) {
        push @path, $tree[$depth][$index];
        push @paths,[@path];
        
        my $sum = pathSum(\@path);
        if ($sum > $maxSum) {$maxSum = $sum;}
        print "@path \t Sum: $sum \t Max: $maxSum\n";
        return;
    }
    else {
        
        push @path, $tree[$depth][$index];
        
        my @pathleft = @path;
        my @pathright = @path;
        
        printPaths($depth+1,$index,\@pathleft);
        printPaths($depth+1,$index+1,\@pathright);
    }
}















