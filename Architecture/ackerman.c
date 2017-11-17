#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int count,depth,maxdepth,registerSets,cwp,overflows,underflows,filledRegisters;

void deeper(){
	if(depth > maxdepth){
		maxdepth = depth;
	}
	if(filledRegisters < registerSets){
		filledRegisters++;
	}else{
		overflows++;
	}
}

void sub(){
	if(filledRegisters > 0){
		filledRegisters--;
	}else{
		underflows++;
	}
}
int ackermann(int x, int y) {
	count++;
	depth++;
	deeper();

	if (x == 0) {
		depth--;
		sub();
		return y+1;
	} else if (y == 0) {
		int r = ackermann(x-1, 1);
		depth--;
		sub();
		return r;
	} else {
		int r = ackermann(x-1, ackermann(x, y-1));
		depth--;
		sub();
		return r;
	}
}

int main(int argc, char * argv[]){
	registerSets = 16;
	printf("With %d Register Sets\n",registerSets);
	if(argc < 3)
		return 0;
	char *first = argv[1];
	char *second = argv[2];

	int f = *first - 48;
	int s = *second - 48;
	double totaltime = 0.0;
	printf("Calling ackerman(%d,%d)\n",f,s );
	for(int i = 0; i < 1000; i++){
		count = 0;
		depth = 0;
		cwp = 0;
		overflows = 0;
		underflows = 0;
		filledRegisters = 1;
		maxdepth = 0;
		clock_t begin = clock();

		int ack = ackermann(f,s);

		clock_t end = clock();

		double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		
		totaltime += time_spent;
	}

	totaltime /= 1000;
	printf("Procedure Calls: %d\nMax Depth: %d\nOverflows: %d\nUnderflows:%d\nAverage Time Taken In 1000 Calls: %f\n",count,maxdepth,overflows,underflows,totaltime);
	return 1;
}

