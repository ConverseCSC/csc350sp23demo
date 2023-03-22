#include <iostream>
#include <vector>
// futureval
using namespace std;

#include "PlayingCard.hpp"

bool tests_pass() {
  bool correct = true;

  // Test construction, suit
  // cout << "Constructor" << endl;
  PlayingCard friendly("Hearts", "Jack");
  // Test rankName()
  // cout << "rankName" << endl;
  correct = correct && (friendly.rankName() == "Jack");
  // Test suit()
  correct = correct && (friendly.suit() == "Hearts");

  vector<PlayingCard> deck = PlayingCard::makeDeck();
  correct = correct && (deck.size() == 52);

  return correct;
}

int main() {
  if (tests_pass()) {
    cout << "PlayingCard tests passed" << endl;
  }
  return 0;
}