//Author: Heather Minke
//Hw2.c

#include <stdint.h>

unsigned long M;

unsigned long Random(){
	
	M = 1664525 * M + 1013904223;
	
	return M;
}

//void add_64(int64 *result, int64 *oper1, int64 *oper2){
	
//}
