#include "PlayingCard.hpp"
#include <iostream>

// Owned by class
vector<string> PlayingCard::_SUITS{"Clubs", "Diamonds", "Hearts", "Spades"};
// Owned by class
vector<string> PlayingCard::_RANK_NAMES{"Ace",  "2",     "3",   "4", "5",
                                        "6",    "7",     "8",   "9", "10",
                                        "Jack", "Queen", "King"};

bool PlayingCard::invariant() const {
  bool validSuit = false; // On stack
  bool validRank = false; // On stack
  for (int i = 0; i < this->SUITS().size(); i++) {
    if (this->suit() == this->SUITS().at(i)) {
      validSuit = true;
    }
  }
  for (int i = 0; i < this->RANK_NAMES().size(); i++) {
    if (this->rankName() == this->RANK_NAMES().at(i)) {
      validRank = true;
    }
  }
  return validSuit && validRank; // Copied
}

unique_ptr<vector<unique_ptr<PlayingCard>>> PlayingCard::makeDeck() {
  auto deck =
      make_unique<vector<unique_ptr<PlayingCard>>>(); // On stack, vector is on
                                                      // the heap
  for (string rank : PlayingCard::_RANK_NAMES) {
    for (string suit : PlayingCard::_SUITS) {
      deck->push_back(make_unique<PlayingCard>(suit, rank));
    }
  }
  return move(deck);
}