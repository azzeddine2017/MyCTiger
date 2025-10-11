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

	cOutputFile = "myfile.c"
	cExeFile = "myfile.exe"

	cOutput = ""
	nTabs   = 1

	lLiteralToOutput = True

	lCcode  = False

	C

	func getC
		lCcode = True

	func braceStart

		cOutput += `#include "stdio.h"

int main(int argc, char *argv[])
{
`

	func braceEnd
	
		cOutput += nl+getTabs()+`return 0;
}
`

	func braceExprEval vValue

		if lCcode and vValue
			processCCode(vValue)
			return
		ok

		if lLiteralToOutput
			cOutput += getTabs() + `printf("` + vValue + `");` + nl
		ok

	func processCCode vValue

		aList = str2List(vValue)
		for cLine in aList 
			while left(cLine,1) = tab 
				cLine = substr(cLine,2)
			end
			cLine = getTabs() + cLine
		next 
		vValue = list2Str(aList)
		cOutput += vValue + nl
		lCCode = False

	func getTabs

		return copy(Tab,nTabs)

	func printSourceCode

		? cOutput

	func generateCode
		
		cOutputFile = substr(cTigerFile,".tiger",".c")
		cEXEFile = substr(cTigerFile,".tiger",".exe")
		write(cOutputFile,cOutput)

	func cleanFiles
		
		remove("buildapp.bat")

	func buildAndRun

		buildAndRunTCC()
		cleanFiles()

	func buildAndRunTCC

		generateCode()
		write("buildapp.bat",exefolder()+"\tools\tcc\tcc " + cOutputFile + " -o " + cEXEFile)
		systemSilent("buildapp.bat")
		system(cExeFile)

	func buildAndRunMSVC

		generateCode()
		if ! lTigerFile
			write("buildapp.bat",
				"call "+exefolder()+"\tools\msvc\locatevc.bat"+nl+
				"cl "+cOutputFile + " -o " + cEXEFile + nl +
				cExeFile)
			system("buildapp.bat")
		else 
			write("buildapp.bat",
				`call locatevc.bat >nul`+nl+
				"cl " + cOutputFile + " -o " + cEXEFile + " >nul")
			systemSilent("buildapp.bat")
			system(cExeFile)
		ok
	
