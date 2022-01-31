#include <stdio.h>

void k_clearscr();
void k_print(char *string, int string_length, int row, int col);
void print_border(int start_row, int start_col, int end_row, int end_col);

int main(){

    k_clearscr();
    print_border(0, 0, 25, 80);
    char *message = "OS 4100";
    k_print(message, 7, 12, 40);

    while(1);
}

void k_clearscr(){
    char *f = " ";
    for(int i = 0; i < 25; i++){
        for(int j = 0; j < 80; j++){
            k_print(f, 1, i, j);
        };
    };
}

void print_border(int start_row, int start_col, int end_row, int end_col){
    //top & bottom border
    char *tnb = "#";
    for(int i = start_col; i < end_col; i++){
        k_print(tnb, 1, start_row, i);
    };
    for(int i = start_col; i < end_col; i++){
        k_print(tnb, 1, end_row, i);
    };

    //sides
    char *sides = "|";
    int row = start_row + 1;
    while(row < 24){
        k_print(sides, 1, row, 0);
        k_print(sides, 1, row, 80);
        row++;
    };
    
}