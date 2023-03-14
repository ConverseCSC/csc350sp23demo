// Preprocessor directives to guarantee this file is read no more than once
#ifndef ABSTRACTCARD_H
#define ABSTRACTCARD_H

#include <string>
#include <vector>
using namespace std;

abstract class AbstractCard {
public:
    virtual abstract vector<string> SUITS();
    virtual abstract vector<string> RANK_NAMES();
protected:
    string suit;
    string rank;

    virtual bool invariant();

    AbstractCard(string& suit, string& rank) {
        this->suit = suit;  // Note this->suit and suit are not the same thing!
        this->rank = rank;
    }

    virtual string suit() { return this-> suit; }
    virtual string rankName() { return this->rank; }

};

#endif