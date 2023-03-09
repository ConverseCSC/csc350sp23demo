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
parameters read_params() {
  parameters result;
  cout << "Please enter an initial principal: $";
  cin >> result.P;
  cout << "Please enter the interest rate per compounding period, in percent: ";
  cin >> result.rate;
  result.rate /= 100;
  cout << "Please enter the number of periods: ";
  cin >> result.periods;
  return result;
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

void print_table_array(int periods, double values[]) {
  cout << "period\t\tvalue" << endl;
  cout << "------------------------------" << endl;
  for (int i = 0; i < periods; i++) {
    cout << "\t" << i << "\t\t$" << values[i] << endl;
  }
}

int main() {
  // Read parameters
  parameters params = read_params();
  echo_params(params);

  // Do the calculation, using a vector (which is much like a Python list)
  double *values = calc_growth_array(params);

  // Print as a (somewhat ragged) table
  // Note the array has to be last in the parameter list,
  // since C++ doesn't know how long it is
  print_table_array(params.periods, values);
}