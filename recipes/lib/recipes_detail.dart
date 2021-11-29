import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipesDetail extends StatefulWidget {
  final Recipes recipe;

  const RecipesDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipesDetailState createState() {
    return _RecipesDetailState();
  }
}

// TODO: Add _RecipeDetailState here
class _RecipesDetailState extends State<RecipesDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageURL),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
