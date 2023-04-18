// Preprocessor directives to guarantee this file is read no more than once
#ifndef DECK_H
#define DECK_H

#include <cassert>
#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include "AbstractCard.hpp"
using namespace std;

class Deck {
    private:
        unique_ptr<vector<unique_ptr<UnoCard>>> cards;

    public:
        Deck(unique_ptr<vector<unique_ptr<UnoCard>>> cards_in) {
            this->cards = move(cards_in);
        }
        ~Deck() {
            cout << "Deck destroyed" << endl;
        }

        virtual string toString();
};

#endif
