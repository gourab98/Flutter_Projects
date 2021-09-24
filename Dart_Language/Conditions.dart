void main() {
  var a = 10, b = 20;
  var c = a > b ? a : b;

  a > b
      ? print('a = ($a) is greater than b = ($b)')
      : print('b = ($b) is greater than a = ($a)');

  print(c);

  String name = 'Ranit';

  String nameToPrint = name;

  print(nameToPrint);
}
