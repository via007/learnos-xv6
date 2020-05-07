#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

/*buf[512];

int main(int argc, char *argv[]){
	int fd0, fd1, n;

	if(argc <= 2){
		printf(1, "Need two files");
		exit();
	}

	if((fd0 = open(argv[1], 0_RDONLY)) < 0){
		printf(1, "copy: cannot open %s\n", argv[1]);
		exit();
	}
	if((fd1 = open(argv[2], 0_CREATE|O_RDWR)) < 0){
		printf(1, "copy: cannot open %s\n", argv[2]);
		exit();
	}
	while((n = read (fd0, buf, sizeof(b;
	close(fd1);
	exit();	
}*/
