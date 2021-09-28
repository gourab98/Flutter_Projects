void main() {
  var counter = 0;

  for (var i = 0; i < 4; i++) {
    print("Hello, in for loop");
  }

  while (counter < 4) {
    print('Hello, in while loop');
    counter++;
  }
  counter = 0;

  do {
    print('Hello, in do while loop');
    counter++;
  } while (counter < 4);

  List nameList = ['Mercury', 'Venus', 'Earth', 'Mars'];
  List ageList = [12, 13, 14, 15];

  for (String planet in nameList) {
    print(planet);
  }

  for (int num in ageList) {
    if (num == 13) {
      continue;
    }
    print(num);
  }
}
