// Recipes Classes
class Recipes {
  String label;
  String imageURL;

  Recipes(this.label, this.imageURL);
  static List<Recipes> samples = [
    Recipes('Image 1', 'assets/1.jpg'),
    Recipes('Image 2', 'assets/2.jpg'),
    Recipes('Image 3', 'assets/3.jpg'),
    Recipes('Image 4', 'assets/4.jpg'),
    Recipes('Image 5', 'assets/5.jpg'),
    Recipes('Image 6', 'assets/6.jpg'),
  ];
}
