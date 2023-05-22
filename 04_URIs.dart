/*
*The Uri class provides functions to encode(编码) and decode(解码) strings for use in URIs (which you might know as URLs).
*These functions handle characters that are special for URIs, such as & and =.
*The Uri class also parses and exposes the components of a URI—host, port, scheme, and so on.
*/

/*
*Encoding and decoding fully qualified URIs
*To encode and decode characters except those with special meaning in a URI (such as /, :, &, #), 
*use the encodeFull() and decodeFull() methods. 
*These methods are good for encoding or decoding a fully qualified URI, leaving intact special URI characters.
*/

void fun01() {
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(decoded == uri);
  //Notice how only the space between some and message was encoded.
}

/*
*Encoding and decoding URI components
*To encode and decode all of a string’s characters that have special meaning in a URI,
*including (but not limited to) /, &, and :, use the encodeComponent() and decodeComponent() methods.
*/
void fun02() {
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var deocded = Uri.decodeComponent(encoded);
  assert(deocded == uri);
  //Notice how every special character is encoded.
  //For example, / is encoded to %2F.
}

/*
*Parsing URIs
*If you have a Uri object or a URI string, you can get its parts using Uri fields such as path.
*To create a Uri from a string, use the parse() static method:
*/
void fun03() {
  var uri = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri.scheme == 'https');
  assert(uri.host == 'example.org');
  assert(uri.path == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin == 'https://example.org:8080');
}

/*
*Building URIs
*You can build up a URI from individual parts using the Uri() constructor:
*/
void fun04() {
  var uri = Uri(
      scheme: 'https',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag',
      queryParameters: {'lang': 'dart'});
  assert(uri.toString() == 'https://example.org/foo/bar?lang=dart#frag');
}

/*
*If you don’t need to specify a fragment, to create a URI with a http or https scheme,
*you can instead use the Uri.http or Uri.https factory constructors:
*/
void fun05() {
  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});

  assert(httpUri.toString() == 'http://example.org/foo/bar?lang=dart');
  assert(httpsUri.toString() == 'https://example.org/foo/bar?lang=dart');
}
void main() {
  fun05();
  print('done.');
}
