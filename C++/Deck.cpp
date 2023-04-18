#import "Deck.hpp"
#import <string>

string Deck::toString() {
  string result = "Deck contents";
  for (int i = 0; i < this->cards->size(); i++) {
    result += this->cards->at(i)->toString();
  }
  return result;
}