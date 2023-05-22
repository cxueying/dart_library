/*
*The Dart core library defines many common exceptions and errors. 
*Exceptions are considered conditions that you can plan ahead for and catch. 
*Errors are conditions that you don’t expect or plan for.
*/
class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void fun01() {
  FooException fool = FooException('testText');
  print(fool.toString());
}

void main() {
  fun01();
  print('done.');
}
