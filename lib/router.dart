import 'package:flutter/material.dart';
import 'package:flutter_recipe/models/recipes_model.dart';
import 'package:flutter_recipe/screens/example.dart';
import 'package:flutter_recipe/screens/recipe_details_screen.dart';
import 'package:flutter_recipe/screens/recipes_screen.dart';

const String recipesRoute = '/';
const String recipeDetailsRoute = '/recipeDetails';
const String exampleRoute = '/example';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    print(routeSettings.name);
    switch (routeSettings.name) {
      case recipesRoute:
        return MaterialPageRoute(builder: (_) => RecipesScreen());
      case exampleRoute:
        return MaterialPageRoute(builder: (_) => ExampleScreen());
      case recipeDetailsRoute:
        var details = routeSettings.arguments as Recipe;
        return MaterialPageRoute(
            builder: (_) => RecipeDetailsScreen(recipe: details));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${routeSettings.name}'),
                  ),
                ));
    }
  }
}
