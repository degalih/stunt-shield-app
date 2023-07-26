import 'package:flutter_app/app/models/nutritions.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// FoodRecipeDetail Model.

class FoodRecipeDetail extends Model {
  int? id;
  String? name;
  String? age;
  String? source;
  String? imgUrl;
  Nutritions? nutritions;
  List<String>? ingredients;
  List<String>? steps;

  FoodRecipeDetail();

  FoodRecipeDetail.fromJson(data) {
    id = data['id'];
    name = data['data']['attributes']['name'];
    age = data['data']['attributes']['age'];
    source = data['data']['attributes']['source'];
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
        "source": source,
        "imgUrl": imgUrl,
        "nutritions": nutritions,
        "ingredients": ingredients,
        "steps": steps,
      };
}
