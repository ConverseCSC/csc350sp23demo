#include "UnoCard.hpp"

vector<string> UnoCard::_COLOR_SUITS{"Red", "Yellow", "Green", "Blue"};
vector<string> UnoCard::_COLOR_RANKS{"0",    "1",       "2",       "3", "4",
                                     "5",    "6",       "7",       "8", "9",
                                     "Skip", "Reverse", "Draw Two"};
string UnoCard::_WILD_SUIT = "Wild";
vector<string> UnoCard::_WILD_RANKS{"", "Draw Four"};
vector<string> UnoCard::_SUITS{"Red", "Yellow", "Green", "Blue", "Wild"};
vector<string> UnoCard::_RANK_NAMES{
    "0", "1", "2",    "3",       "4",        "5", "6",        "7",
    "8", "9", "Skip", "Reverse", "Draw Two", "",  "Draw Four"};

bool UnoCard::invariant() const {
  bool valid = false;
  if (this->suit() == _WILD_SUIT) {
    valid = ((this->rankName() == "") || (this->rankName() == "Draw Four"));
  } else if (this->suit() == "Red" || this->suit() == "Yellow" ||
             this->suit() == "Green" || this->suit() == "Blue") {
    for (string rank : _COLOR_RANKS) {
      if (rank == this->rankName()) {
        valid = true;
      }
    }
  }

  return valid;
}

vector<UnoCard> UnoCard::makeDeck() {
  vector<UnoCard> deck;
  for (string rank : _COLOR_RANKS) {
    for (string suit : _COLOR_SUITS) {
      deck.push_back(UnoCard(suit, rank));
      if (rank != "0") {
        deck.push_back(UnoCard(suit, rank));
      }
    }
  }
  string suit = _WILD_SUIT;
  for (string rank : _WILD_RANKS) {
    for (int i = 0; i < 4; i++) {
      deck.push_back(UnoCard(suit, rank));
    }
  }

  return deck;
}