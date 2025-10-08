Tiger = new C

class c 

	cOutput = ""
	nTabs   = 1

	lCcode  = False

	C

	func getC
		lCcode = True

	func braceStart

		cOutput += `
#include "stdio.h"
int main(int argc, char *argv[])
{
`

	func braceEnd
	
		cOutput += `
	return 0;
}
`

	func braceExprEval vValue

		if lCcode and vValue
			cOutput += getTabs() + vValue
			lCCode = False
			return
		ok

		cOutput += getTabs() + `printf("` + vValue + `");` + nl


	func getTabs

		return copy(Tab,nTabs)

	func printSourceCode

		? cOutput
		
	func buildAndRun

		write("myfile.c",cOutput)
		system("cl myfile.c")
		system("myfile.exe")
	
