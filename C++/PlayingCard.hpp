// Preprocessor directives to guarantee this file is read no more than once
#ifndef PLAYINGCARD_H
#define PLAYINGCARD_H

#include <cassert>
#include <memory>
#include <string>
#include <vector>
#include "AbstractCard.hpp" // Quotation marks say, look in the current directory

using namespace std;

class PlayingCard: public AbstractCard {
    private:
        static vector<string> _SUITS;
        static vector<string> _RANK_NAMES;

    protected:
        virtual bool invariant() const;
    
    public:
        PlayingCard(const string& suit, const string& rank): AbstractCard(suit, rank) {
            assert(this->invariant());
        }

        virtual vector<string> SUITS() const { return _SUITS; }
        virtual vector<string> RANK_NAMES() const { return _RANK_NAMES; }
        virtual string toString() const { 
            return this->rankName() + " of " + this->suit(); // Where does this live?
        }

        static unique_ptr<vector<unique_ptr<PlayingCard>>> makeDeck();  // Implementation in .cpp file
};

#endif