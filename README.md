# MyCTiger

## 📜 Introduction

MyCTiger transforms the Ring programming language into a powerful domain-specific language (DSL) for generating and building C programs. 

It empowers developers to enjoy the performance and efficiency of C while leveraging Ring’s expressive syntax and productivity for DSL creation. Unlike traditional approaches that embed Ring within C applications or extend the Ring VM using C code, MyCTiger reimagines Ring as a meta-language for C. 

This isn’t about runtime language integration—it’s about compile-time code generation. With MyCTiger, Ring becomes a high-level interface for producing C code, enabling direct injection of raw C and seamless use of existing C libraries without bindings.

## 🎉 Key Features of MyCTiger

• **Compile-Time Ring Execution:** Leverage Ring source code during compilation to drive C code generation.

• **Meta-Language for C:** Treat Ring as a high-level DSL for generating and structuring C programs.

• **Raw C Injection:** Seamlessly embed raw C code into the generated output for full control and flexibility.

• **Unrestricted C Integration:** Use C libraries directly—no bindings, wrappers, or runtime glue required.

## 🔧 Development Status

This is a prototype of the idea (Could be extended by interested developers with their own libraries and DSLs).

Development and testing are performed using MS-Windows, Ring 1.24, and TCC (Exists in the Tools folder).

To build Tiger.exe, run build.bat after installing the Ring programming language.

Usage:

	Tiger <filename.tiger>

Output:

	<filename.c>		// Generated C source code
	<filename.exe>		// Executable file


## 📚 Examples

(1) Hello World program (hello.tiger)

	Tiger {
		"Hello, World! \n"
	}

To build and run the program

	Tiger hello.tiger

Output

	Hello, World!

Generated C code (hello.c)

	#include "stdio.h"

	int main(int argc, char *argv[])
	{
		printf("Hello, World! \n");
		return 0;
	}
	

(2) Using C code in Tiger files (helloc.tiger)

	Tiger {
		C ` printf("Hello, World! - Using C code\n");  `
	}

To build and run the program

	Tiger helloc.tiger

Output

	Hello, World! - Using C code

Generated C code (helloc.c)

	#include "stdio.h"

	int main(int argc, char *argv[])
	{
		printf("Hello, World! - Using C code\n");
		return 0;
	}
	

(3) Using Ring code at compile-time (test.tiger)

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

		for t=1 to 3 
			"" + t + "- C programming is fun!\n"
		next

		for t=1 to 5 
			"t = " + t + " square = " + (t*t) + "\n"
		next
	
	}
  
To build and run the program

	Tiger test.tiger

Output:

	Hello, World!
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10
	I am using Windows
	1- C programming is fun!
	2- C programming is fun!
	3- C programming is fun!
	t = 1 square = 1
	t = 2 square = 4
	t = 3 square = 9
	t = 4 square = 16
	t = 5 square = 25	

Generated C code (test.c)

	#include "stdio.h"

	int main(int argc, char *argv[])
	{

		printf("Hello, World! \n");
	
		for (int x=1 ; x <= 10 ;x++) {
			printf("%d\n",x);
		}
	
		printf("I am using Windows\n");

		printf("1- C programming is fun!\n");
		printf("2- C programming is fun!\n");
		printf("3- C programming is fun!\n");

		printf("t = 1 square = 1\n");
		printf("t = 2 square = 4\n");
		printf("t = 3 square = 9\n");
		printf("t = 4 square = 16\n");
		printf("t = 5 square = 25\n");

		return 0;
	}

# 📜License 

The MyCTiger project is distributed under the MIT License.