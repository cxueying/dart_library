/*
*You can find particular locations within a string, 
*as well as check whether a string begins with or ends with a particular pattern.
*/
void fun01() {
  //Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  //Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  //Dose a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  //Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);
}

/*
*Extracting data from a string
*You can get the individual characters from a string as Strings or ints, 
*respectively. To be precise, you actually get individual UTF-16 code units; 
*high-numbered characters such as the treble clef symbol (‘\u{1D11E}’) are two code units apiece.
*
*You can also extract a substring or split a string into a list of substrings:
*/
void fun02() {
  //Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  //Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  //Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

  ///Use split() with an empty string parameter to get
  ///a list of all characters (as strings);
  ///good for iterating.
  for (final char in 'hello'.split(' ')) {
    print(char);
  }

  //Get all the UTF-16 code units int the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
}

/*
*Converting to uppercase or lowercase
*You can easily convert strings to their uppercase and lowercase variants:
*/
void fun03() {
  //Convert to uppercase
  assert('web apps'.toUpperCase() == 'WEB APPS');

  //Convert to lowercase
  assert('WEB APPS'.toLowerCase() == 'web apps');
}

/*
*Trimming and empty strings
*Remove all leading and trailing(尾随) white space with.
*To check whether a string is empty (length is zero), use .trim()isEmpty
*/
void fun04() {
  //Trim a string
  assert('   hello   world   '.trim() == 'hello   world');

  //Cheack whether a string is empty
  assert(''.isEmpty);

  //String with only white space are not empty
  assert('   '.isNotEmpty);
}

/*
*Replacing part of a string
*Strings are immutable objects, which means you can create them but you can’t change them.
*the method returns a new String without changing the original String:replaceAll()
*/
void fun05() {
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  //greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
}

/*
*Building a string
*A StringBuffer doesn’t generate a new String object until is called.
*The method has an optional second parameter that lets you specify a separator—in this case,
*a space.toString()writeAll()
*/
void fun06() {
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');
}

/*
*Regular expressions(正则表达式)
*The RegExp class provides the same capabilities as JavaScript regular expressions.
*Use regular expressions for efficient searching and pattern matching of strings.
*/
void fun07() {
  //Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  //contains() can use a regular expression
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  //Replace ever match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
}

/*
*Regular expressions
*You can work directly with the RegExp class, too. The Match class provides access to a regular expression match.
*/
void fun08() {
  var numbers = RegExp(r'\d+');
  var someDigits = 'llamas live 15 to 20 years';

  //Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));

  //Loop through all matches.
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); //15, then 20
  }
}

void main() {
  fun08();
  print('done.');
}
