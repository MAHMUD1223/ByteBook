
#include <iostream>
#include <string>
#include <cmath>

using namespace std;

int main() {
    cout << "Your name :";

    string name; //taking one word name
    cin >> name;

    string fullName;//taking full name
    getline(cin,fullName);

    cout<<name <<"!"<<endl;
    return 0;
}
