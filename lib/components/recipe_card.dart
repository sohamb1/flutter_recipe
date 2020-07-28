import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe/models/recipes_model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 280,
          height: 280,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('images/${recipe.image}'),
          ),
        ),
        SizedBox(height: 20),
        Text(recipe.name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        SizedBox(height: 20),
        Text(recipe.quantities,
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15)),
        SizedBox(height: 20),
        Expanded(
          child: Text(recipe.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15)),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: recipe.recipeAmountList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            recipe.recipeAmountList[index].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                  Flexible(
                    child:
                        Text(recipe.recipeAmountList[index].quantity,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)))
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
