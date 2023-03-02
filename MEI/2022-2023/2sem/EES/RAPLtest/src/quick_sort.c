//Implementation of Quick Sort in C
#include <stdio.h>
#include <stdlib.h>
#define swap(t, x, y) { t z = x; x = y; y = z; }
int partition(int [], int, int);
void quick_sort(int [], int, int);
void print_array(int [], int);

int main(int argc, char*argv[]){

	if(atoi(argv[1])==1 ) {	
		int a[] = {2523,3613,9347,2881,9405,392,3626,5100,4312,605,3037,8870,2976,3422,7853,6575,2148,6619,405,2018,4830,9448,7251,8290,4318,8032,4951,5115,202,6403,9549,9077,6368,5248,8310,5774,5641,1937,7226,9953,8894,6615,5175,1870,38,9380,8445,2186,2352,5202,556,7182,4651,7808,5472,8969,5840,6775,437,2394,3178,6338,7823,9547,1586,6134,1673,7227,4423,8899,3532,9669,5514,8708,1539,5552,4440,6336,4091,6792,1539,4647,326,2542,8807,2151,7863,999,8926,8300,9745,8457,4638,7569,4356,6225,55,6029,9804,830};
		int length = sizeof(a) / sizeof(int);
		quick_sort(a, 0, length - 1);
	}

	if(atoi(argv[1])==2) {
		int b[] = {3244,9467,734,3310,4273,888,3941,4252,473,8198,5483,7359,8137,7939,8740,2573,3534,8321,8480,1669,5230,1456,5957,1844,5322,9773,9063,1280,6980,5948,7500,224,5415,8234,3534,9689,9122,3827,293,5948,8377,5776,9659,2867,67,8399,5440,9953,6721,272};
		int length = sizeof(b) / sizeof(int);
		quick_sort(b, 0, length - 1);
	}

	if(atoi(argv[1])==3) {
		int c[] = {8237,6224,5942,8806,9538,6749,8089,2471,5767,2912};
		int length = sizeof(c) / sizeof(int);
		quick_sort(c, 0, length - 1);
	}

	
	return EXIT_SUCCESS;
}

int partition(int A[], int p, int r) {
	int x = A[r]; //pivot
	int i = p - 1, j;
	for(j = p; j < r ; j++) {
		if(A[j] <= x) {
			i = i + 1;
			swap(int, A[i], A[j]); 
		}
	}
	i = i + 1;
	swap(int, A[i], A[r]);
	return i;
}
void quick_sort(int A[], int p, int r) {
	if(p < r) {
		int t = (rand() % ( r - p + 1) + p);
		swap(int, A[t], A[r]); 
		//Used to avoid O(n^2) worst case
		
		int q = partition(A, p, r);
		quick_sort(A, p, q - 1);
		quick_sort(A, q + 1, r);
	}
}
void print_array(int A[], int n) {
	int i = 0;
	putchar('[');
	while(i < n) {
		if(i > 0) printf(", ");
		printf("%d", A[i++]); 
	}
	puts("]");
}