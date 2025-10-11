cTigerFile = ""

func testingTiger

	lTesting = True

func startTiger

	aPara = appArguments()
	if aPara
		if fexists(aPara[1])
			cTigerFile = aPara[1]
			if isWindows()
				cTigerFile = substr(cTigerFile,"/","\")
			ok
			lTigerFile = ( right(cTigerFile,6) = ".tiger" )
			cCode = "load '" + cTigerFile + "'" + nl 
			eval(cCode)
		ok
	else 
		appInfo()
	ok

func appInfo

	? "==========================================================================="
	? "MyCTiger version 1.0.0"
	? "2025, Mahmoud Fayed"
	? "==========================================================================="
	? "Usage: tiger <filename.tiger>"
	? "==========================================================================="
