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
*/







