#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

using namespace std;

int main() {

  string number, name, holder;
  bool criteria = true;

  ifstream readfile, rfile, nfile;
  ofstream writefile;

  readfile.open("name.csv");
  nfile.open("number.csv");
  rfile.open("school_data.csv");
  writefile.open("output.txt");
  name = "";
  holder = "";
  number = "";

  for (int i = 0; i < 26213; i++) {
    getline(readfile, name);
    getline(nfile, number);
    getline(rfile, holder);
    for (int j = 0; j < 132; j++) {
      if (name == holder) {
        writefile << number << endl;
        j = 133;
      } else {
        getline(readfile, name);
        getline(nfile, number);
      }
    }
    readfile.close();
    nfile.close();
    readfile.open("name.csv");
    nfile.open("number.csv");
  }

  rfile.close();
  readfile.close();
  nfile.close();

  // writefile.close();
}