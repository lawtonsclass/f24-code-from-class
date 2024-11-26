// there are no method/function declarations in Java--you just start
// implementing!
public class Counter extends Object { // every class in java by
                                      // default extends Object
  // stores the actual count
  private int count;

  // Java has no default parameters, so you can't do something like:
  //   public Counter(int startingValue = 0) { ... }
  // You have to make two separate constructors

  public Counter() {
    count = 0;
  }

  public Counter(int startingValue) {
    count = startingValue;
  }

  public int getCount() {
    return count;
  }

  public void inc() {
    count++;
  }

  public void reset() {
    count = 0;
  }

  public void reset(int newValue) {
    count = newValue;
  }

  // Java has no operator overloading--you have to use words.
  // There are also no const parameters--you have to do some weird
  // tricks if you want to guarantee other doesn't get modified.
  public Counter add(Counter other) {
    Counter ret = new Counter(count + other.count);
    return ret;
  }

  public static void main(String[] args) {
    Counter c = new Counter();
    c.inc();
    c.inc();
    c.inc();
    System.out.println(c.getCount());

    Counter c2 = new Counter(42);
    c2.inc();
    System.out.println(c2.getCount());

    Counter c3 = c.add(c2);
    System.out.println(c3.getCount());
  }
}
