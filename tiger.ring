load "globals.ring"

func testingTiger

	lTesting = True

class Tiger from C 

	func braceEnd 

		super.braceEnd()
		printSourceCode()
		if lTesting = False
			buildAndRun()	
		ok	

class c 

	cOutput = ""
	nTabs   = 1

	lLiteralToOutput = True

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

		if lLiteralToOutput
			cOutput += getTabs() + `printf("` + vValue + `");` + nl
		ok

	func getTabs

		return copy(Tab,nTabs)

	func printSourceCode

		? cOutput
		
	func buildAndRun

		write("myfile.c",cOutput)
		system("cl myfile.c")
		system("myfile.exe")
	
