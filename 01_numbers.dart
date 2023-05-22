/*
*You can convert a string into an integer or double with the methods of int and double, respectively:parse()
*/
void fun01() {
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
}

/*
*Or use the parse() method of num, which creates an integer if possible and otherwise a double:
*/
void fun02() {
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
}

/*
*To specify the base of an integer, add a parameter:radix
*/
void fun03() {
  assert(int.parse('42', radix: 16) == 66);
}

/*
*Use the method to convert an int or double to a string. 
*To specify the number of digits to the right of the decimal, use toStringAsFixed(). 
*To specify the number of significant digits in the string, use toStringAsPrecision():toString()
*/
void fun04() {
  //Convert an in to a string.
  assert(42.toString() == '42');

  //Convert a double to a string.
  assert(123.456.toString() == '123.456');

  //Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

  //Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}

void main() {
  fun04();
  print('done.');
}
