import 'package:flutter_app/app/models/nutritions.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// FoodRecipeDetail Model.

class FoodRecipeDetail extends Model {
  int? id;
  String? name;
  String? age;
  String? recipe_source;
  String? large_portion;
  String? nutrition_info_source;
  String? imgUrl;
  Nutritions? nutritions;
  List<String>? ingredients;
  List<String>? steps;

  FoodRecipeDetail();

  FoodRecipeDetail.fromJson(data) {
    id = data['data']['id'];
    name = data['data']['attributes']['name'];
    age = data['data']['attributes']['age'];
    recipe_source = data['data']['attributes']['recipe_source'];
    large_portion = data['data']['attributes']['large_portion'];
    nutrition_info_source = data['data']['attributes']['nutrition_info_source'];
    imgUrl = data['data']['attributes']['img']['data']['attributes']['url'];
    nutritions = Nutritions.fromJson(data['data']['attributes']['nutritions']);
    ingredients = List<String>.from(
        data['data']['attributes']["ingredients"].map((x) => x));
    steps =
        List<String>.from(data['data']['attributes']["steps"].map((x) => x));
  }

  toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "recipe_source": recipe_source,
        "nutrition_info_source": nutrition_info_source,
        "large_portion": large_portion,
        "imgUrl": imgUrl,
        "nutritions": nutritions,
        "ingredients": ingredients,
        "steps": steps,
      };
}
