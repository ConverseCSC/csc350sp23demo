#include "PlayingCard.hpp"

vector<string> PlayingCard::_SUITS{"Clubs", "Diamonds", "Hearts", "Spades"};
vector<string> PlayingCard::_RANK_NAMES{"Ace",  "2",     "3",   "4", "5",
                                        "6",    "7",     "8",   "9", "10",
                                        "Jack", "Queen", "King"};

bool PlayingCard::invariant() const {
  bool validSuit = false;
  bool validRank = false;
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
  return validSuit && validRank;
}

vector<PlayingCard> PlayingCard::makeDeck() {
  vector<PlayingCard> deck;
  for (string rank : PlayingCard::_RANK_NAMES) {
    for (string suit : PlayingCard::_SUITS) {
      deck.push_back(PlayingCard(suit, rank));
    }
  }
  return deck;
}