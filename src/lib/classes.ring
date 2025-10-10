class Tiger from C 

	func braceEnd 

		super.braceEnd()
		if ! lTigerFile
			printSourceCode()
		ok
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

	func generateCode

		write("myfile.c",cOutput)

	func cleanFiles
		
		remove("myfile.c")
		remove("buildapp.bat")

	func buildAndRun

		buildAndRunTCC()
		cleanFiles()

	func buildAndRunTCC

		generateCode()
		write("buildapp.bat",exefolder()+"\tools\tcc\tcc myfile.c")
		systemSilent("buildapp.bat")
		system("myfile.exe")

	func buildAndRunMSVC

		generateCode()
		if ! lTigerFile
			write("buildapp.bat",
				"call "+exefolder()+"\tools\msvc\locatevc.bat"+nl+
				"cl myfile.c"+nl+
				"myfile.exe")
			system("buildapp.bat")
		else 
			write("buildapp.bat",
				`call locatevc.bat >nul`+nl+
				"cl myfile.c >nul")
			systemSilent("buildapp.bat")
			system("myfile.exe")
		ok
	
