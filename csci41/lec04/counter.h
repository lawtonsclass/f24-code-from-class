#ifndef COUNTER_H
#define COUNTER_H

#include <iostream>
#include <vector>

class Counter {
  public:
    Counter(); // *default* constructor
    Counter(int startingCount); // parameterized constructor
    void inc();
    void reset(int newCount = 0);
    int getCount() const;
    Counter operator+(const Counter& other) const;
    friend Counter operator*(const Counter& a, const Counter& b);

  private:
    int count;
    std::vector<int> v; // default constructor called automatically unless you change it
    const double d;
};

std::ostream& operator<<(std::ostream& os, const Counter& c);

#endif /* end of include guard: COUNTER_H */
