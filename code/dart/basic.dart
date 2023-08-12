void main() {
  // to print something
  print('hello this is my name Mahmud');
  
  // calling variable
 // Numbers: int
	int score = 23;
	var count = 23;     // It is inferred as integer automatically by compiler
	int hexValue = 0xEADEBAEE;

	// Numbers: double
	double percentage = 93.4;
	var percent = 82.533;
	double exponents = 1.42e5; 

	// Strings
	String name = "Henry";
	var company = "Google";

	// Boolean
	bool isValid = true;
	var isAlive = false;

	print(score);
	print(exponents);

	// NOTE: All data types in Dart are Objects.
	// Therefore, their initial value is by default 'null'

// Literals
	var isCool = true;
	int x = 2;
	"John";
	4.5;

	// Various ways to define String Literals in Dart
	String s1 = 'Single';
	String s2 = "Double";
	String s3 = 'It\'s easy';
	String s4 = "It's easy";

	String s5 = 'This is going to be a very long String. '
			'This is just a sample String demo in Dart Programming Language';


	// String Interpolation : Use ["My name is $name"] instead of ["My name is " + name]
	String name1 = "Kevin";

	print("My name is $name1");
	print("The number of characters in String Kevin is ${name1.length}");


	int l = 20;
	int b = 10;

  // formatting strings

	print("The sum of $l and $b is ${l + b}");
	print("The area of rectangle with length $l and breadth $b is ${l * b}");

  // constants and final


  // final
	final cityName = 'Mumbai';
	//	cityName = 'Peter';     // Throws an error

	final String countryName = 'India';

	// const
	const PI = 3.14;
	const double gravity = 9.8;
  // note: to declare a constant at class-level we have to make it `static const`

  // conditional statements
  // IF and ELSE Statements
	var salary = 15000;

	if (salary > 20000) {
		print("You got promotion. Congratulations !");
	} else {
		print("You need to work hard !");
	}

	// IF ELSE IF Ladder statements
	var marks = 70;

	if (marks >= 90 && marks < 100) {
		print("A+ grade");
	} else if (marks >= 80 && marks < 90) {
		print("A grade");
	} else if (marks >= 70 && marks < 80) {
		print("B grade");
	} else if (marks >= 60 && marks < 70) {
		print("C grade");
	} else if (marks > 30 && marks < 60) {
		print("D grade");
	} else if (marks >= 0 && marks < 30) {
		print("You have failed");
	} else {
		print("Invalid Marks. Please try again !");
	}
  


  // Conditional Expressions

	// 1.   condition ? exp1 : exp2
	// If condition is true, evaluates expr1 (and returns its value);
	// otherwise, evaluates and returns the value of expr2.

	int m = 2;
	int n = 3;

	int smallNumber = m < n ? m : n;
	print("$smallNumber is smaller");



	// 2.   exp1 ?? exp2
	// If expr1 is non-null, returns its value; otherwise, evaluates and
	// returns the value of expr2.

	var name2 = null;

	String nameToPrint = name2 ?? "Guest User";
	print(nameToPrint);
  

  // Switch statement
  // Switch Case Statements: Applicable for only 'int' and 'String'
  String gender = "M";

  switch (gender) {
    case 'M':
        print("Congrats you have got 1 bonus point");
        break;
    case 'F':
        print('Congrats you have got -2 negative points');
        break;
    default:
        print('Get the hell out of here');
  }
  

  // Loops

  // FOR Loop
	// WAP to find the even numbers between 1 to 10
	for (int i = 1; i <= 10; i++) {

		if ( i % 2 == 0) {
			print(i);
		}
	}
	// for ..in loop
	List planetList = ["Mercury", "Venus", "Earth", "Mars"];

	for (String planet in planetList) {
		print(planet);
	}
  


  // WHILE Loop
	// WAP to find the even numbers between 1 to 10
	var  i = 1;
	while (i <= 10) {
		if (i % 2 == 0) {
			print(i);
		}
		i++;
	}
  



  // DO-WHILE Loop
	// WAP to find the even numbers between 1 to 10
	int k = 1;
	do {
		if ( k % 2 == 0) {
			print(k);
		}
		k++;
	} while ( k <= 10);



  // BREAK keyword
	// Using Labels
	// Nested FOR Loop
	myOuterLoop: for (int i = 1; i <= 3; i++) {
		innerLoop: for (int j = 1; j <= 3; j++) {
			print("$i $j");
			if (i == 2 && j == 2) {
				break myOuterLoop; // if we use only break here, then only inner loop will be terminated
			}
		}
	}




	// CONTINUE keyword
	// Using Labels
	myLoop: for (int i = 1; i <= 3; i++) {
		myInnerLoop: for (int j = 1; j <= 3; j++) {
			if (i == 2 && j == 2) {
				continue myLoop;
			}
			print("$i  $j");
		}
	}

}