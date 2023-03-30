#include <iostream>
#include <vector>
// futureval
using namespace std;

#include "PlayingCard.hpp"
#include "UnoCard.hpp"

bool PlayingCard_tests_pass() {
  bool correct = true; // Local variable, lives on the stack

  // Test construction, suit
  // cout << "Constructor" << endl;
  PlayingCard friendly(
      "Hearts",
      "Jack"); // On stack, destroyed when PlayingCard_tests_pass() returns
  // Test rankName()
  // cout << "rankName" << endl;
  correct = correct && (friendly.rankName() == "Jack");
  // Test suit()
  correct = correct && (friendly.suit() == "Hearts");

  correct = correct && (friendly.toString() == "Jack of Hearts");

  unique_ptr<vector<PlayingCard>> deck =
      PlayingCard::makeDeck(); // Pointer is on stack vector is on heap.
                               // Vector is destroyed when
                               // PlayingCard_tests_pass() returns
  correct = correct && (deck->size() == 52);

  return correct;
}

bool UnoCard_tests_pass() {
  bool correct = true; // Local variable, on system stack

  // Test construction, suit
  // cout << "Constructor" << endl;
  UnoCard color(
      "Blue", "Skip"); // On stack, destroyed when UnoCard_tests_pass() returns
  // Test rankName()
  // cout << "rankName" << endl;
  correct = correct && (color.rankName() == "Skip");
  // Test suit()
  correct = correct && (color.suit() == "Blue");

  correct = correct && (color.toString() == "Blue Skip");

  unique_ptr<vector<UnoCard>> deck =
      UnoCard::makeDeck(); // Pointer is on stack, vector is on heap.
                           // vector is destroyed when
                           // UnoCard_tests_pass() returns.
  correct = correct && (deck->size() == 108);

  return correct;
}

int main() {
  if (PlayingCard_tests_pass()) {
    cout << "PlayingCard tests passed" << endl;
  }
  if (UnoCard_tests_pass()) {
    cout << "UnoCard tests passed" << endl;
  }
  // So you know it's done, if they *didn't* pass
  cout << "Finished testing" << endl;
  return 0;
}