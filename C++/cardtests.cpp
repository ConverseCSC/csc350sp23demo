#include <iostream>
#include <vector>
// futureval
using namespace std;

#include "PlayingCard.hpp"
#include "UnoCard.hpp"

bool PlayingCard_tests_pass() {
  bool correct = true;

  // Test construction, suit
  // cout << "Constructor" << endl;
  PlayingCard friendly("Hearts", "Jack");
  // Test rankName()
  // cout << "rankName" << endl;
  correct = correct && (friendly.rankName() == "Jack");
  // Test suit()
  correct = correct && (friendly.suit() == "Hearts");

  correct = correct && (friendly.toString() == "Jack of Hearts");

  vector<PlayingCard> deck = PlayingCard::makeDeck();
  correct = correct && (deck.size() == 52);

  return correct;
}

bool UnoCard_tests_pass() {
  bool correct = true;

  // Test construction, suit
  // cout << "Constructor" << endl;
  UnoCard color("Blue", "Skip");
  // Test rankName()
  // cout << "rankName" << endl;
  correct = correct && (color.rankName() == "Skip");
  // Test suit()
  correct = correct && (color.suit() == "Blue");

  correct = correct && (color.toString() == "Blue Skip");

  vector<UnoCard> deck = UnoCard::makeDeck();
  correct = correct && (deck.size() == 108);

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