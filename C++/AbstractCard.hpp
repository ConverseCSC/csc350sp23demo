// Preprocessor directives to guarantee this file is read no more than once
#ifndef ABSTRACTCARD_H
#define ABSTRACTCARD_H

#include <iostream>
#include <string> // <> says look on the include path for a built-in library
#include <vector>
using namespace std;

class AbstractCard {

    private:
        // "const" is a promise not to change whatever it is
        string _suit; 
        string _rank;

    protected:
        // "const" at the end means it doesn't change the object
        virtual bool invariant() const = 0;

        // Protected constructor is a strong hint that the class is abstract
        AbstractCard(const string& suit, const string& rank) {
            // Note this->suit and suit are not the same thing!
            this->_suit = suit;  
            this->_rank = rank;
            // assert(this->invariant()); // Polymorphism doesn't yet work here
        }
    
    public:
        /**
         * Destructor.  Since strings are pretty good about
         * deleting themselves, this just prints which card
         * is getting cleaned up.
         */
        virtual ~AbstractCard() {
            cout << "Destructor: " << this->_suit << " " << this->_rank << endl;
        }

        // Logically, these two functions should be class methods,
        //     not instance methods, but C++ doesn't do virtual class methods
        // "= 0" part means they're pure-virtual functions, which
        //     mark the class as abstract
        virtual vector<string> SUITS() const = 0; 
        virtual vector<string> RANK_NAMES() const = 0;
        
        virtual string suit() const { return this->_suit; }
        virtual string rankName() const { return this->_rank; }

        virtual string toString() const { 
            return (this->_suit + " " + this->_rank); 
        }

        //static vector<AbstractCard> makeDeck() = 0;
};

#endif