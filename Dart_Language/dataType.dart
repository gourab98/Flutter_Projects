void main() {
  int Date = 23;
  var Month = 9; // It is inferred as integer automatically
  double Year = 2011;

  String FirstName = "Ranit";
  var LastName = "Saha";

  print(
      'The person name is $FirstName $LastName and his birthday is $Date/$Month/$Year');

  Value();
  StringManupulation();
}

void Value() {
  int HexValue = 0xAAAEEEEEEE;
  double Exponents = 1.45e7;

  print(HexValue);
  print(Exponents);
}

void StringManupulation() {
  String s1 = 'Single ';
  String s2 = "And Double. ";
  String s3 = 'So it\'s normal to get confused. ';
  String s4 = "You can use it's in double quote, ";
  String s5 = 'This is a string. ' 'And it is an another string. ';
  String s6 = 'Amit.';
  String s7 = "And obviously I am " + s6;
  String s8 = "Please Listen, $s6";
  String s9 = s1 + s2 + s3 + s4 + s5 + s7 + s8;

  print(s9);
  print('The number of character in String s9 is ${s9.length - 33} + 33');
}
