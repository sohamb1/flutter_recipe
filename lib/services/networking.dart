import 'package:http/http.dart' as http;

String getRecipes = 'https://gist.githubusercontent.com/sohamb1/d6f5f3d17eeda759ae392b60c6c07e42/raw/recipes';

class NetworkHelper {
  Future<http.Response> getRecipesData(String url) {
    return http.get(
        url
    );
  }
}