#include <stdio.h>

void k_clearscr();
extern void k_print(char *string, int string_length, int row, int col);
void print_border(int start_row, int start_col, int end_row, int end_col);

int main(){

    k_clearscr();
    
    print_border(0, 0, 24, 79);
    char *message = "OS 4100";
    k_print(message, 7, 12, 35);
    
    while(1);
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
    char *tnb = "-";
    for(int col = start_col + 1; col < end_col; col++){
        k_print(tnb, 1, start_row, col);
    };
    

    //side borders
    char sideBar[] = "|";
    for(int row = start_row + 1; row < end_row; row++){
        k_print(sideBar, 1, row, 0);
        k_print(sideBar, 1, row, 79);
    };

    //bottom border
    for(int i = start_col + 1; i < end_col; i++){
        k_print(tnb, 1, end_row, i);
    };

    char corners[] = "+";
    k_print(corners, 1, 0, 0);
    k_print(corners, 1, 24, 0);
    k_print(corners, 1, 0, 79);
    k_print(corners, 1, 24, 79);

    
}