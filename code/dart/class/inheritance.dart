/*
void main() {

    var dog = Dog();
    dog.breed = "Labrador";
    dog.color = "Black";
    dog.bark();
    dog.eat();

    var cat = Cat();
    cat.color = "White";
    cat.age = 6;
    cat.eat();
    cat.meow();

    var animal = Animal();
    animal.color = "brown";
    animal.eat();
}

class Animal {

    late String color;

    void eat() {
        print("Eat !");
    }
}

class Dog extends Animal {      // Dog is Child class or sub class, Animal is super or parent class

    late String breed;

    void bark() {
        print("Bark !");
    }
    String color = "Black";     // Property Overriding
    // Method Overriding
    void eat() {
        print("Dog is eating !");
        super.eat(); // calling the parent class
        print("More food to eat");
    }
}

class Cat extends Animal {      // Cat is Child class or sub class, Animal is super or parent class
    late int age;
    void meow() {
        print("Meow !");
    }
}

// inheritance with constructors

// Objectives
// 1. Inheritance with Default Constructor and Parameterised Constructor
// 2. Inheritance with Named Constructor

void main() {

    var dog1 = Dog("Labrador", "Black");

    print("");

    var dog2 = Dog("Pug", "Brown");

    print("");

    var dog3 = Dog.myNamedConstructor("German Shepherd", "Black-Brown");
}

class Animal {

    late String color;

    Animal(String color) {
        this.color = color;
        print("Animal class constructor");
    }

    Animal.myAnimalNamedConstrctor(String color) {
        print("Animal class named constructor");
    }
}

class Dog extends Animal {

    late String breed;

    Dog(String breed, String color) : super(color) {
        this.breed = breed;
        print("Dog class constructor");
    }

    Dog.myNamedConstructor(String breed, String color) : super.myAnimalNamedConstrctor(color) {
        this.breed = breed;
        print("Dog class Named Constructor");
    }
}

// Abstract Class
// 1. Abstract Method
// 2. Abstract Class
void main() {
//	var shape = Shape();        // Error. Cannot instantiate Abstract Class
    var rectangle = Rectangle();
    rectangle.draw();

    var circle = Circle();
    circle.draw();
}

abstract class Shape {
    // Define your Instance variable if needed
    late int x;
    late int y;
    void draw();        // Abstract Method *MUST BE LIKE THIS`*
    void myNormalFunction() {
        // Some code
    }
}
class Rectangle extends Shape {
    void draw() {
        print("Drawing Rectangle.....");
    }
}
class Circle extends Shape {
    void draw() {
        print("Drawing Circle.....");
    }
}

//  Interface
void main() {
    var tv = Television();
    tv.volumeUp();
    tv.volumeDown();
}
class Remote {
    void volumeUp() {
        print("______Volume Up from Remote_______");
    }
    void volumeDown() {
        print("______Volume Down from Remote_______");
    }
}
class AnotherClass {
    void justAnotherMethod(){
        // Code
    }
}

// Here Remote and AnotherClass acts as Interface
class Television implements Remote, AnotherClass {
    void volumeUp() {
//		super.volumeUp();       // Not allowed to call super while implementing a class as Interface
        print("______Volume Up in Television_______");
    }
    void volumeDown() {
        print("______Volume Down in Television_______");
    }
    void justAnotherMethod() {
        print("Some code");
    }
}
*/

// Static Methods and Variables
void main() {
    var circle1 = Circle();
    
//	circle1.pi;     // 4 bytes
    var circle2 = Circle();
//	circle2.pi;     // 4 bytes
    // 8 bytes      // waste of extra 4 bytes

    Circle.pi;  // 4 bytes
    Circle.pi;  // No more memory will be allocated .


//	circle.calculateArea();

	print(Circle.pi);           // Syntax to call Static Variable

	Circle.calculateArea();     // Syntax to call Static Method
}

class Circle {

    static const double pi = 3.141567;
    static int maxRadius = 5;

    late String color;

    static void calculateArea() {
        print("Some code to calculate area of Circle");
//		myNormalFunction();     // Not allowed to call instance functions
//		this.color;             // You cannot use 'this' keyword and even cannot access Instance variables
    }

    void myNormalFunction() {
        calculateArea();
        this.color = "Red";
        print(pi);
        print(maxRadius);
    }
}