class RecipesModel {
  List<Recipe> recipes;

  RecipesModel({this.recipes});

  factory RecipesModel.fromJson(List<dynamic> json) {
    final recipes = json.cast<Map<String, dynamic>>();
    return RecipesModel(
        recipes: new List<Recipe>.from(
            recipes.map((itemsJson) => Recipe.fromJson(itemsJson))));
  }
}

class Recipe {
  String name;
  String description;
  String quantities;
  List<Amount> recipeAmountList;
  List<String> recipeInstructions;
  String image;

  Recipe(
      {this.name,
      this.description,
      this.quantities,
      this.recipeAmountList,
      this.recipeInstructions,
      this.image});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final amountList = json['ig'].cast<Map<String, dynamic>>();
    final details = json['in'].cast<String>();
    return Recipe(
        name: json['fn'],
        description: json['dc'],
        quantities: json['cn'],
        image: json['pf'],
        recipeAmountList: new List<Amount>.from(
            amountList.map((itemsJson) => Amount.fromJson(itemsJson))),
        recipeInstructions: details);
  }
}

class Amount {
  String name;
  String quantity;

  Amount({this.name, this.quantity});

  Amount.fromJson(Map<String, dynamic> json) {
    name = json['n'];
    quantity = json['c'];
  }
}
