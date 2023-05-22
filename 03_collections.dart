//############################################################################//
//    ### LIST ###

/*
*you can use literals to create and initialize lists
*Alternatively(或者), use one of the List constructors. 
*The List class also defines several methods for adding items to and removing items from lists.
*/

void fun01() {
  //Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

  //Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

  //Add to a list.
  fruits.add('kiwis');

  //Add multiple item to a list.
  fruits.addAll(['graps', 'bananas']);

  //Get the list length.
  assert(fruits.length == 5);

  //Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  assert(appleIndex == 0);
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  //Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

  //You can also create a List using one of the constructots.
  //Create a List which contain 99 'broccoli'
  var vegetables = List.filled(99, 'broccoli');
  //.every
  //all element in vegetables is 'broccoli'
  assert(vegetables.every((element) => element == 'broccoli'));
}

/*
*Use to find the index of an object in a list:indexOf()
*/
void fun02() {
  var fruits = ['apples', 'oranges'];

  //Access a list item by index
  assert(fruits[0] == 'apples');

  //Find an item in a list.
  assert(fruits.indexOf('apples') == 0);
}

/*
*Sort a list using the method.
*You can provide a sorting function that compares two objects. 
*This sorting function must return < 0 for smaller, 0 for the same, and > 0 for bigger.
*The following example uses , which is defined by Comparable and implemented by String.sort()compareTo()
*/
void fun03() {
  var fruits = ['bananas', 'apples', 'oranges'];

  //Sort a list.
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
}

/*
*Lists are parameterized types (generics), so you can specify the type that a list should contain:
*/
void fun04() {
  //This list should contain only strings.
  var fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];

  //"fruits is String" is always true.
  // ignore: unnecessary_type_check
  assert(fruit is String);

  //Error: 'int' can't be assigned to 'String'
  //fruits.add(5);
}

//############################################################################//
//    ### SET ###

/*
*A set(集) in Dart is an unordered collection of unique items.
*Because a set is unordered, you can’t get a set’s items by index (position).
*/
void fun05() {
  //Create an empty set of strings.
  //        ATTENTION:
  //The statements is {} not [];
  //[] is use as List
  var ingredients = <String>{};

  //Add new item to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  //Adding a duplicate(重复) item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

  //Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  //You can also create sets using one of the constructors.
  var atomicNumbers = Set.from([79, 22, 52]);
  assert(atomicNumbers.length == 3);
}

/*
*Use and to check whether one or more objects are in a set:contains()containsAll()
*/
void fun06() {
  var ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  //Check whether an item is in the set.
  assert(ingredients.contains('titanium'));

  //Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));
}

/*
*An intersection(交集) is a set whose items are in two other sets.
*/
void fun07() {
  var ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  //Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

//############################################################################//
//    ### MAP ###

/*
*A map(映射), commonly known as a dictionary or hash, is an unordered collection of key-value pairs.
*Maps associate a key to some value for easy retrieval. Unlike in JavaScript, Dart objects are not maps.
*You can declare a map using a terse literal syntax, or you can use a traditional constructor:
*/
void fun08() {
  //Maps often use a strings as key.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  print(hawaiianBeaches);

  //If you want to visit the value of the map, and the value is List.
  //You should use this statement "map[key]?[elementIndex]" to visit it
  assert(hawaiianBeaches['Oahu']?[0] == 'Waikiki');

  //Maps can be built from a constructor.
  //    ### can't understand how to use Map()
  var searchTherms = Map();
  print(searchTherms);

  //Maps are parameterized types; you can specify what type te key and value should be.
  var nobleGases = Map<int, String>();
  nobleGases = {1: 'test1', 2: 'test2', 3: 'test3'};
  nobleGases.addAll({4: 'test4', 5: 'test5'});
  print(nobleGases);
}

/*
*You add, get, and set map items using the bracket syntax. Use remove() to remove a key and its value from a map.
*/
void fun09() {
  var nobleGases = {54: 'xenon'};

  //Retrieve(检索) a value with a key
  assert(nobleGases[54] == 'xenon');

  //Check whether a map contains a key.
  assert(nobleGases.containsKey(54));

  //Check whether a map contains a value
  assert(nobleGases.containsValue('xenon'));

  //Remove a key and ite value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
}

/*
*You can retrieve(检索) all the values or all the keys from a map:
*/
void fun10() {
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  //Get all the key as an unordered collection (an Interable).
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  //Get all the values as an unordered collection (an Interable of Lists).
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  //.any
  //there are more then 1 'Waikiki' in values.
  assert(values.any((element) => element.contains('Waikiki')));
}

/*
*To check whether a map contains a key, use containsKey().
*Because map values can be null, you cannot rely on simply getting the value for
*the key and checking for null to determine the existence of a key.
*/
void fun11() {
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));
}

/*
*Use the putIfAbsent() method when you want to assign a value to a key if and only if 
*the key does not already exist in a map. You must provide a function that returns the value.
*/
//This function is called by fun12();
String pickToughesKid() {
  return 'test';
}

void fun12() {
  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => pickToughesKid());
  print(teamAssignments);
  assert(teamAssignments['Catcher'] != null);
}

/*
*Common collection methods
*List, Set, and Map share common functionality found in many collections.
*Some of this common functionality is defined by the Iterable class, which List and Set implement.
*
*Use isEmpty or isNotEmpty to check whether a list, set, or map has items:
*/
void fun13() {
  //List
  var coffees = <String>[];
  var teas = ['green', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
}

/*
*To apply a function to each item in a list, set, or map, you can use forEach():
*/
void fun14() {
  var teas = ['green', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));
}

/*
*When you invoke(调用) froEach() on a map, your function must take two arguments (the key and value):
*/
void fun15() {
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((key, value) {
    print('I want to visit $key and swim at $value');
    //I want to visit Oach and swim at [Waikiki, Kailua, Waimanalo], etc.
  });
}

/*
*Iterables(可迭代对象) provide the map() method, which gives you all the results in single object:
*/
void fun16() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((e) => e.toUpperCase());

  //The statement between 306 and 308  is equal to
  //loudTeas.forEach(print);
  loudTeas.forEach((element) {
    print(element);
  });
}

/*
*To force your function to be called immediately on each item, use map().toList or map().toSet():
*/
void fun17() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((e) => e.toUpperCase()).toList();

  loudTeas.forEach(print);
}

/*
*Use iterable's where() method to get all the items that match a condition.
*Use iteralbe's any() and every() methods to check whether some or all item match a conditoin.
*/
void fun18() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  //Chamomile is not caffeinated.
  bool isDecaffeinated(String tesName) => tesName == 'chamomile';

  //Use where() to find only the items that return true from the provided function.
  var decaffeinatedTeas = teas.where((element) => isDecaffeinated(element));
  //or teas.where(isDecaffeinated);
  print(decaffeinatedTeas);

  //Use any() to check whether at least one item in the collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

  //Use every() to check whether all the item in a collection satisfy a condition.
  assert(!teas.every((isDecaffeinated)));
}

void main() {
  fun18();
  print('done.');
}
