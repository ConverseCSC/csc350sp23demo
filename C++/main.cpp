#include <iostream>
#include <vector>
// futureval
using namespace std;

// Preprocessor directives to set constants
#define TRUE 1
#define FALSE 0

#include "PlayingCard.hpp"

bool tests_pass() {
  bool correct = TRUE;

  // Test construction, suit
  PlayingCard friendly("Hearts", "Jack");

  return correct;
}

int main() {
  if (tests_pass()) {
    cout << "PlayingCard tests passed" << endl;
  }
  return 0;
}