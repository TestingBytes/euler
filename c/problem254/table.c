#include <stdlib.h>
#include <stdio.h>

typedef struct {
    int input;
    int output;
} TABLEDATA;

typedef struct {
    TABLEDATA **array;
    int num_elements;
    int num_allocated;
} TABLE;

int main() {
    TABLEDATA** array = NULL;
    
    // add 1 element to the array
    
    array = (TABLEDATA**)realloc(array,sizeof(TABLEDATA*));
    array[0] = (TABLEDATA*)malloc(sizeof(TABLEDATA));

    array[0]->input = 5;
    array[0]->output = 6;

    printf(" (%d,%d,) \n", array[0]->input, array[0]->output );

    // Now my way...

    TABLE *table = NULL;
    table = (TABLE*)realloc(table,sizeof(TABLE));
    table->array = (TABLEDATA**)realloc(table->array,sizeof(TABLEDATA*));
    table->array[0] = (TABLEDATA*)malloc(sizeof(TABLEDATA));
    table->array[0]->input = 5;
    table->array[0]->output = 6;

    printf(" (%d,%d) \n", table->array[0]->input, table->array[0]->output);

    return 0;
}
