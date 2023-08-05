import 'package:stunt_shield_app/app/models/favorite_info.dart';
import 'package:stunt_shield_app/app/models/response/food_recipe_favorite.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';

Future<FavoriteInfo> checkFavoriteRecipe(int recipeDetailId) async {
  List<FoodRecipeFavorite> foodRecipeFavorite =
      await api<ApiService>((request) => request.getFavoriteRecipe());

  final isBookmarked =
      foodRecipeFavorite.any((recipe) => recipe.recipeId == recipeDetailId);
  int favoriteId = -1;

  if (isBookmarked) {
    favoriteId = foodRecipeFavorite
        .firstWhere((recipe) => recipe.recipeId == recipeDetailId)
        .favoriteId!;
  }

  return FavoriteInfo(isBookmarked, favoriteId);
}
