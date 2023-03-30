// Preprocessor directives to guarantee this file is read no more than once
#ifndef UNOCARD_H
#define UNOCARD_H

#include <cassert>
#include <memory>
#include <string>
#include <vector>
#include "AbstractCard.hpp" // Quotation marks say, look in the current directory

using namespace std;

class UnoCard: public AbstractCard {
    private:
        static vector<string> _COLOR_SUITS;
        static string _WILD_SUIT;
        static vector<string> _SUITS;
        static vector<string> _COLOR_RANKS;
        static vector<string> _WILD_RANKS;
        static vector<string> _RANK_NAMES;

    protected:
        virtual bool invariant() const;
    
    public:
        UnoCard(const string& suit, const string& rank): AbstractCard(suit, rank) {
            assert(this->invariant());
        }
        virtual vector<string> SUITS() const { return _SUITS; }
        virtual vector<string> RANK_NAMES() const { return _RANK_NAMES; }
        static unique_ptr<vector<UnoCard>> makeDeck();  // Implementation in .cpp file
};

#endif