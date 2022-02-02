#include <stdio.h>

void k_clearscr();
extern void k_print(char *string, int string_length, int row, int col);
void print_border(int start_row, int start_col, int end_row, int end_col);

int main(){

    k_clearscr();
    
    print_border(0, 0, 24, 80);
    char *message = "OS 4100";
    k_print(message, 35, 12, 35);
    int run = 1;
    while(run == 1);
}

void k_clearscr(){
    char *c = " ";
        
    for(int i = 0; i < 25; i++){
        for(int j = 0; j < 80; j++){
            k_print(c, 3840, i, j);
        };
    };
}

void print_border(int start_row, int start_col, int end_row, int end_col){
    
    //top border
    char *all = "$";
    for(int i = start_col; i < end_col; i++){
        k_print(all, 80, start_row, i);
    };
    

    //side borders
    int row = start_row + 1;
    while(row < 24){
        k_print(all, 1, row, 0);
        k_print(all, 1, row, 79);
        row++;
    };

    //bottom border
    for(int i = start_col; i < end_col; i++){
        k_print(all, 1, end_row, i);
    };

    // char *corners = "+";
    // k_print(corners, 1, 0, 0);
    // k_print(corners, 1, 25, 0);
    // k_print(corners, 1, 0, 80);
    // k_print(corners, 1, 25, 80);

    
}