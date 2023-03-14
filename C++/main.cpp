#include <iostream>
#include <vector>
// futureval
using namespace std;

// Define the structure type first
struct parameters {
  double P;
  double rate;
  int periods;
};

// Now, use it in a function
// The &result means call by reference, so result in this routine is an
//    *alias* for, not a copy of, the parameter in the calling routine
//    (in this case, the variable params in main()).  Call by reference
//    allows this function to change the value the calling routine sees,
//    by side effect.
void read_params(parameters &result) {
  cout << "Please enter an initial principal: $";
  cin >> result.P;
  cout << "Please enter the interest rate per compounding period, in percent: ";
  cin >> result.rate;
  result.rate /= 100;
  cout << "Please enter the number of periods: ";
  cin >> result.periods;
}

void echo_params(parameters params) {
  cout << "Investing $" << params.P << " at " << (params.rate * 100) << "% for "
       << params.periods << " periods.";
  cout << endl;
}

vector<double> calc_growth_vector(parameters params) {
  double P = params.P;
  vector<double> values = {P}; // values[i] := value at end of period i
  for (int i = 1; i <= params.periods; i++) {
    P += (P * params.rate);
    values.push_back(P);
  }
  return values;
}

void print_table_vector(vector<double> values) {
  cout << "period\t\tvalue" << endl;
  cout << "------------------------------" << endl;
  for (int i = 0; i < values.size(); i++) {
    cout << "\t" << i << "\t\t$" << values[i] << endl;
  }
}

// void is what you use when you don't want a function to return anything
void print_result_as_vector(vector<double> values) {
  for (double val : values) { // Another form of definite loop
    cout << "$" << val << endl;
  }
}

double *calc_growth_array(parameters params) {
  double P = params.P;
  double *values = new double[params.periods + 1]; // Array: fixed size
  for (int i = 0; i <= params.periods; i++) {
    values[i] = P;
    P += (P * params.rate);
  }
  return values;
}

void print_table_array(int periods, double *values) {
  cout << "period\t\tvalue" << endl;
  cout << "------------------------------" << endl;
  for (int i = 0; i < periods; i++) {
    cout << "\t" << i << "\t\t$" << *(values++) << endl;
  }
}

int main() {
  parameters params; // uninitialized

  // Read parameters
  read_params(params); // Call by value; doesn't change the calling routine

  echo_params(params);

  // Do the calculation, using a vector (which is much like a Python list)
  double *values = calc_growth_array(params);

  // Print as a (somewhat ragged) table
  // Note the array has to be last in the parameter list,
  // since C++ doesn't know how long it is
  print_table_array(params.periods, values);

  // Can also use an array to totally break the type system
  char char_array[10] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'};
  print_table_array(5 * params.periods, reinterpret_cast<double *>(char_array));
}