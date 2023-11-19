// functions

// normal
/* void main() {
	findPerimeter(4, 2);
	int rectArea = getArea(10, 5);
	print("The area is $rectArea");
}
void findPerimeter(int length, int breadth) {
	int perimeter = 2 * (length + breadth);
	print("The perimeter is $perimeter");
}
int getArea(int length, int breadth) {

	int area = length * breadth;
	return area;
}*/



/*
// SHORT HAND SYNTAX
void main() {
	findPerimeter(4, 2);
	int rectArea = getArea(10, 5);
	print("The area is $rectArea");
}
void findPerimeter(int length, int breadth) => print("The perimeter is ${2 * (length + breadth)}");
int getArea(int length, int breadth) => length * breadth;
// "=>" is known as FAT ARROW
// "=> expression" is a SHORT HAND SYNTAX for { return expression; }
// Example "=> length * breadth" is SHORT HAND SYNTAX for { return length * breadth; }
*/



/*
// parameaters
void main() {
	printCities("New York", "New Delhi", "Sydney");
	printCountries("USA");  // You can skip the Optional Positional Parameters
        findVolume(10, height: 20, breadth: 5);     // Sequence doesn't matter in Named Parameter
	findVolume2(10);     // Default value comes into action
	findVolume2(10, breadth: 5, height: 30);     // Overrides the old value with new one
	
}
// Required Parameters
void printCities(String name1, String name2, String name3) {
	print("Name 1 is $name1");
	print("Name 2 is $name2");
	print("Name 3 is $name3");
}
// Optional Positional Parameters
void printCountries(String name1, [String name2, String name3]) {
	print("Name 1 is $name1");
	print("Name 2 is $name2");
	print("Name 3 is $name3");
 }
 // Optinal named Parameters
 int findVolume(int length, {int breadth, int height}) {
	print("Length is $length");
	print("Breadth is $breadth");
	print("Height is $height");
	print("Volume is ${length * breadth * height}");
}
int findVolume2(int length, {int breadth = 2, int height = 20}) {
	print("Lenght is $length");
	print("Breadth is $breadth");
	print("Height is $height");
	print("Volume is ${length * breadth * height}");
}


// lamda function or anonymus function
void main() {

    // Defining Lambda: 1st way
    Function addTwoNumbers = (int a, int b) {
        var sum = a + b;
        print(sum);
    };

    var multiplyByFour = (int number) {
        return number * 4;
    };

    // Defining Lambda: 2nd way: Function Expression: Using Short Hand Syntax or FAT Arrow ( '=>' )
    Function addNumbers = (int a, int b) => print(a + b);

    var multiplyFour = (int number) => number * 4;


    // Calling lambda function
    addTwoNumbers(2, 5);
    print(multiplyByFour(5));

    addNumbers(3, 7);
    print(multiplyFour(10));
}


// A example of Normal function
void addMyNumbers(int a, int b) {

    var sum = a + b;
    print(sum);
}
*/



// higher order function
void main() {

    // Example One: Passing Function to Higher-Order Function
    Function addNumbers = (a, b) => print(a + b);
    someOtherFunction("Hello", addNumbers);

    // Example Two: Receiving Function from Higher-Order Function
    var myFunc = taskToPerform();
    print(myFunc(10));      // multiplyFour(10)         // number * 4       // 10 * 4       // OUTPUT: 40
}

// Example one: Accepts function as parameter
void someOtherFunction(String message, Function myFunction) {       // Higher-Order Function
    print(message);
    myFunction(2, 4);       // addNumbers(2, 4)    // print(a + b);   // print(2 + 4)       // OUTPUT: 6
}
// Example two: Returns a function
Function taskToPerform() {       // Higher-Order Function
    Function multiplyFour = (int number) => number * 4;
    return multiplyFour;
}
