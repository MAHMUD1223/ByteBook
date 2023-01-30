#include <iostream>
#include <cmath>

using namespace std;

int main() {
    double radius;
    cout << "Circle radius: ";
    cin >> radius;
    double area = 3.1416*pow(radius, 2);
    cout<< radius
        << " circle's total area is "
        << area <<endl;
    return 0;
}