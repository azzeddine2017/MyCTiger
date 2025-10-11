cTigerFile = ""

func testingTiger

	lTesting = True

func processArguments

	aPara = appArguments()
	if aPara and fexists(aPara[1])
		cTigerFile = aPara[1]
		if isWindows()
			cTigerFile = substr(cTigerFile,"/","\")
		ok
		lTigerFile = ( right(cTigerFile,6) = ".tiger" )
		cCode = "load '" + cTigerFile + "'" + nl 
		eval(cCode)
	ok
