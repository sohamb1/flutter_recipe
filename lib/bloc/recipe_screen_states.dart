abstract class RecipeScreenStates {}

class UninitializedState extends RecipeScreenStates {}

class LoadingState extends RecipeScreenStates {}

class LoadedState extends RecipeScreenStates{
  var response;
  LoadedState({this.response});
}

class ErrorState extends RecipeScreenStates {}