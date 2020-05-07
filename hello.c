#include "types.h"
#include "stat.h"
#include "user.h"

#define STDOUT 1
int add(int a, int b){
	return a+b;
}

int main(int argc, char *argv[]){
	printf(STDOUT, "hello\n");
	printf(STDOUT,"%d\n", add(4, 5));

	exit();
}
