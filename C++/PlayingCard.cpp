#include "PlayingCard.hpp"

vector<string> PlayingCard::_SUITS{"Clubs", "Diamonds", "Hearts", "Spades"};
vector<string> PlayingCard::_RANK_NAMES{"Ace",  "2",     "3",   "4", "5",
                                        "6",    "7",     "8",   "9", "10",
                                        "Jack", "Queen", "King"};

vector<PlayingCard> PlayingCard::makeDeck() {
  vector<PlayingCard> deck;
  for (string rank : PlayingCard::_RANK_NAMES) {
    for (string suit : PlayingCard::_SUITS) {
      deck.push_back(PlayingCard(suit, rank));
    }
  }
  return deck;
}