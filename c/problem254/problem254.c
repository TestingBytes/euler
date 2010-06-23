
/*
 * f(n) is the sum of the factorials of the digits of n
 *  Example: f(342) = 3! + 4! + 2! = 32
 *
 * sf(n) is the sum of the digits of f(n)
 *  Example: sf(342) = 3 + 2 = 5
 *
 * g(i) is the smallest integer n such that sf(n) = i
 *  Example: sf(342) = 5; sf(25) = 5, therefore g(5) = 25
 *
 * sg(i) as the sum of the digits of g(i)
 *  Example:sg(5) = 2 + 5 = 7
 *
 *  g(20) is 267 and Sum ( sg(i) ) for i < i < 20 is 156
 *
 * What is Sum( sg(i) ) for i < i < 150
*/

#include <stdlib.h>
#include <stdio.h>

typedef struct {
    int input;
    int output;
} DATA;

typedef struct {
    DATA **array;
    int num_elements;
    int num_allocated;
} TABLE;

TABLE *table_f;

int AddToTable(TABLE* lookupTable, int input, int output) {

    DATA item;
    item.input = input;
    item.output = output;

    if( lookupTable->num_elements == lookupTable->num_allocated) {
        if(lookupTable->num_allocated == 0) {
            // Allocate 10 initially, then double 
            lookupTable->num_allocated = 10;
        } else {
            lookupTable->num_allocated *= 2;
        }

        void *_tmp = realloc(lookupTable->array,
                (lookupTable->num_allocated * sizeof(DATA*) ) );

        if( !_tmp ) {
            fprintf(stderr, "ERROR: realloc failed!\n");
            return( -1 );
        }

        lookupTable->array = (DATA**)_tmp;

    }

    // Enough memory is available for more data

    //lookupTable.array[lookupTable.num_elements++] = item;
   
    lookupTable->array[lookupTable->num_elements] =
        (DATA*)malloc(sizeof(DATA));

    lookupTable->array[lookupTable->num_elements]->input = input;
    lookupTable->array[lookupTable->num_elements]->output = output; 
    return ++lookupTable->num_elements;
}

int getLookupValue(TABLE* lookupTable, int input) {
    
    if( lookupTable->num_elements == 0 ) { return -1; }

    int i;
    for(i=0; i< lookupTable->num_elements; i++) {
        if( lookupTable->array[i]->input == input )
            return lookupTable->array[i]->output;
    }

    return -1;
}

int factorial(int n) {
        if(n <= 1) {
            return n;
        } else {
            return n * factorial( n-1 );
        }
}

int f(int n) {
    int sum = 0;

    while( n != 0 ) {
        sum += factorial(n % 10);
        n = n/10;
    }

    return sum;
}

int sumDigits(int n) {
    int sum = 0;

    while( n != 0 ) {
        sum += n % 10;
        n = n/10;
    }

    return sum;
}

int sf(int n) {
    // first check if value is in lookup table
    // int lookup = getLookupValue(table_f, n);
    // if( lookup != -1) { 
    //     return lookup; }
    // else {
        int fn = f(n);
    //     AddToTable(table_f,n,fn);
        return sumDigits( fn );
    // }
}

int g( int i ) {
    // first check if value is in lookup table

    int lookup = getLookupValue(table_sf, i);
    if( lookup != -1 )
        return lookup;
    else {
        int n=0;

        while( sf(n) != i ) {
            n++;
        }
        return n;
    }

    //printf("g: g(%d) == %d\n",i,n);

    return n;
}

int sg( int i ) {
    sumDigits ( g ( i ) );
}

int ssg( int low, int high ) {

    int i, sum = 0;
    for( i = low; i <= high; i++) {
        printf("ssg: %d of %d...\n",i,high);
        sum += sg(i);
    }

    return sum;
}

void initLookupTable(*TABLE table) {
    table = (TABLE*)malloc(sizeof(TABLE));
    table->array = (DATA**)malloc(sizeof(DATA*));
    table->num_elements = 0;
    table->num_allocated = 0;
}

int main(){

    //*table_f = NULL;
    //table_f = (TABLE*)malloc(sizeof(TABLE));
    //table_f->array = (DATA**)malloc(sizeof(DATA*));
    //table_f->num_elements = 0;
    //table_f->num_allocated = 0;

    initLookupTable(table_f);
    initLookupTable(table_sf);

    printf("%d! is %d\n", 3, factorial(3) );
    printf("f(%d) = %d\n", 342, f(342) );
    printf("sf(%d) = %d\n", 342, sf(342) );
    printf("g(%d) = %d\n", 5, g(5) );        
    printf("sg(%d) = %d\n",  5, sg(5) );
    printf("g(%d) = %d\n", 20, g(20) );

    printf(" sum( sg(i) ) for 1 < i < 30 == %d\n", ssg(1,30) );      

    printf(" sum( sg(i) ) for 1 < i <= %d == %d\n", 40, ssg(1, 40) );

    printf("Lookup Stats: table_f.num_elements=%d\n", table_f->num_elements);
       // 
    return 0;
}
