// Preprocessor directives to guarantee this file is read no more than once
#ifndef PLAYINGCARD_H
#define PLAYINGCARD_H

#include <string>
#include <vector>
#include "AbstractCard.hpp" // Quotation marks say, look in the current directory

using namespace std;

class PlayingCard: AbstractCard {
    private:
        vector<string> _SUITS;
        vector<string> _RANK_NAMES;

    public:
        PlayingCard(const string& suit, const string& rank): AbstractCard(suit, rank) {}

        virtual vector<string> SUITS() const { return _SUITS; }
        virtual vector<string> RANK_NAMES() const { return _RANK_NAMES; }
};

#endif