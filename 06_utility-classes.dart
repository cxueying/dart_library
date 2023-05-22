/*
*Comparing objects
*Implement the Comparable interface to indicate that an object can be compared to another object,
*usually for sorting. The compareTo() method returns < 0 for smaller, 0 for the same, and > 0 for bigger.
*/

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

void fun01() {
  var short = const Line(1);
  var long = const Line(100);

  assert(short.compareTo(long) < 0);
}

/*
*Implementing map keys
*Each object in Dart automatically provides an integer hash code, and thus can be used as a key in a map. 
*However, you can override(重写) the hashCode getter to generate a custom hash code. If you do, you might also want to override the == operator. 
*Objects that are equal (via ==) must have identical hash codes. A hash code doesn’t have to be unique, but it should be well distributed.
*/
class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  //Override hashCode using the statci hashing methods provide by the 'Object' class.
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

void fun02() {
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';

  //The dart.dev example write p1.hashCode == p2.hashCode,
  //but that is not true.
  assert(p1.hashCode != p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}

/*
*Iteration(迭代)
*The Iterable and Iterator classes support sequential(顺序) access to a collection of values. 
*To practice using these collections, follow the Iterable collections codelab.
*
*If you create a class that can provide Iterators for use in for-in loops, extend (if possible) or implement Iterable. 
*Implement Iterator to define the actual iteration ability.
*/
class Process{
  //Represents a process...

}

// class ProcessIterator implements Iterable<Process>{
//   @override
//   Process get current => 
//   @override
//   bool moveNext() => ...
// }

//A mythical class that lets you interate through all processes. Extends a subclass of [Iterable].
// class Processess extends IterableBase<Process>{
//   @override
//   final Iterator<Process> iterator = ProcessIterator();
// }

// void fun03(){
//   //Iterable objects can be used with for-in.
//   for(final process in Processess()){
//     //Do something with the process.
//   }
// }

void main() {
  fun02();
  print('done');
}
