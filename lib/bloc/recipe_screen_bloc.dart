import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/bloc/recipe_screen_events.dart';
import 'package:flutter_recipe/bloc/recipe_screen_states.dart';
import 'package:flutter_recipe/services/networking.dart';
import 'package:http/http.dart' as http;

class RecipeScreenBloc extends Bloc<RecipeScreenEvents, RecipeScreenStates> {
  RecipeScreenBloc() : super(UninitializedState());

  @override
  void onTransition(
      Transition<RecipeScreenEvents, RecipeScreenStates> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<RecipeScreenStates> mapEventToState(
      RecipeScreenEvents event) async* {
    if (event is FetchRecipes) {
      yield LoadingState();

      http.Response response =
      await NetworkHelper().getRecipesData(getRecipes);
      if (response.statusCode == 200) {
        yield LoadedState(response: response.body);
      } else {
        yield ErrorState();
      }
    }
  }
}