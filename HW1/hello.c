#include <stdio.h>

int loopfun()
{
	int ans = 0;
	for(int i = 0; i < 100; ++i)
	{
		ans += i;
	}
	return ans;
}

void branchfun()
{
	int a = 1;
	if(a > 2){
		printf("Greater");
	}
	else{
		printf("Lesser");
	}
}

int main()
{
	printf("Hello World!");
	loopfun();
	branchfun();
	return 0;
}
