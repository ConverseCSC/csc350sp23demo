#include <iostream>
#include <vector>
// futureval
using namespace std;

#include "AbstractCard.hpp"
#include "Deck.hpp"
#include "PlayingCard.hpp"
#include "UnoCard.hpp"

bool PlayingCard_tests_pass() {
  bool correct = true; // Local variable, lives on the stack

  // Test construction, suit
  // cout << "Constructor" << endl;
  // friendly is on the stack
  //     its destructor will be called when PlayingCard_test_pass returns
  // PlayingCard itself is on the heap
  //     its destructor will be called from friendly's destructor
  auto friendly = make_unique<PlayingCard>("Hearts", "Jack");
  // PlayingCard friendly(
  //     "Hearts",
  //     "Jack"); // On stack, destroyed when PlayingCard_tests_pass() returns
  // Test rankName()
  // cout << "rankName" << endl;
  correct = correct && (friendly->rankName() == "Jack");
  // Test suit()
  correct = correct && (friendly->suit() == "Hearts");

  correct = correct && (friendly->toString() == "Jack of Hearts");

  unique_ptr<vector<unique_ptr<PlayingCard>>> deck =
      PlayingCard::makeDeck(); // Pointer is on stack vector is on heap.
                               // Vector is destroyed when
                               // PlayingCard_tests_pass() returns
  correct = correct && (deck->size() == 52);
  vector<string> ranks = friendly->RANK_NAMES();
  vector<string> suits = friendly->SUITS();
  for (int i = 0; i < deck->size(); i++) {
    correct = correct && (deck->at(i)->rankName() == ranks[i / suits.size()]);
    correct = correct && (deck->at(i)->suit() == suits[i % suits.size()]);
  }

  return correct;
}

bool UnoCard_tests_pass() {
  bool correct = true; // Local variable, on system stack

  // Test construction, suit
  // cout << "Constructor" << endl;
  // color is on the stack
  //   its destructor will be called when UnoCard_tests_pass returns
  // The actual UnoCard indicated by color (*color) is on the heap
  //   its destructor will be called from color's destructor
  unique_ptr<UnoCard> color = make_unique<UnoCard>("Blue", "Skip");
  // UnoCard color(
  //     "Blue", "Skip"); // On stack, destroyed when UnoCard_tests_pass()
  //     returns
  // Test rankName()
  // cout << "rankName" << endl;
  correct = correct && (color->rankName() == "Skip");
  // Test suit()
  correct = correct && (color->suit() == "Blue");

  correct = correct && (color->toString() == "Blue Skip");

  unique_ptr<vector<unique_ptr<UnoCard>>> deck =
      UnoCard::makeDeck(); // Pointer is on stack, vector is on heap.
                           // vector is destroyed when
                           // UnoCard_tests_pass() returns.
  correct = correct && (deck->size() == 108);

  return correct;
}

bool deck_tests_pass() {
  Deck uno_deck(UnoCard::makeDeck());
  cout << uno_deck.toString() << endl;
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