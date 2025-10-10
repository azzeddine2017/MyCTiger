func testingTiger

	lTesting = True

func processArguments

	aPara = appArguments()
	if aPara and fexists(aPara[1])
		lTigerFile = ( right(aPara[1],6) = ".tiger" )
		cCode = "load '" + aPara[1] + "'" + nl 
		eval(cCode)
	ok
