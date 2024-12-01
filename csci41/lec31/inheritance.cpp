#include <iostream>
#include <string>
#include <vector>
using namespace std;

// this is an "abstract class"--it can't be instantiated
class Phone {
 protected:  // protected lets us use these things in subclasses
  double price;
  int batteryLife;

 public:
  Phone(double price, int batteryLife)
      : price(price), batteryLife(batteryLife) {}
  double getPrice() const { return price; }
  int getBatteryLife() const { return batteryLife; }

  virtual bool isAnAppleProduct() const = 0;  // pure virtual method
};

class iPhone : public Phone {
 protected:
  string processorModel;

 public:
  iPhone(double price, int batteryLife, string processorModel)
      : Phone(price, batteryLife), processorModel(processorModel) {}
  string getProcessorModel() const { return processorModel; }
  bool isAnAppleProduct() const override { return true; }
};

class AndroidPhone : public Phone {
 public:
  AndroidPhone(double price, int batteryLife) : Phone(price, batteryLife) {}
  bool isAnAppleProduct() const override { return false; }
  bool runsLinux() const { return true; }
};

int main() {
  /* Phone p(42, 42);  // can't do this */

  iPhone iphone42(9999, 240, "A44");
  AndroidPhone a(399, 48);

  cout << iphone42.getProcessorModel() << endl;
  cout << iphone42.getPrice() << endl;
  cout << iphone42.isAnAppleProduct() << endl;
  cout << a.getBatteryLife() << endl;
  cout << a.isAnAppleProduct() << endl;
  cout << a.runsLinux() << endl;

  // we can treat subclasses like the base class!
  vector<Phone*> v = {&iphone42, &a};
  cout << v.at(0)->isAnAppleProduct() << endl;

  return 0;
}
