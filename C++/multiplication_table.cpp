#include <iostream>
// Print a multiplication table
using namespace std;

int main() {
  int TOP_NUM = 10;
  // Initial space
  cout << "   ";
  // Top row of table
  for (int i = 0; i < TOP_NUM; i++) {
    cout << i << "   ";
  }
  cout << endl;

  // Table
  for (int i = 0; i < TOP_NUM; i++) {
    cout << i << "  ";
    for (int j = 0; j < TOP_NUM; j++) {
      cout << (i * j) << "  ";
    }
    cout << endl;
  }
}