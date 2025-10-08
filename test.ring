load "tiger.ring"

Tiger {

	"Hello, World! \n"

	#=================================================
	C `
		for (int x=1 ; x <= 10 ;x++) {
			printf("%d\n",x);
		}
	`
	#=================================================

	if isWindows() 
		"I am using Windows\n"
	else
		"I am not using Windows\n"
	ok

	for t=1 to 10 
		string(t) "- C programming is fun!\n"
	next

	for t=1 to 10 
		"t = " string(t) " square = " string(t*t) "\n"
	next

	
}

Tiger.printSourceCode()
Tiger.buildAndRun()

