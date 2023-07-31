import 'package:nylo_framework/nylo_framework.dart';

/// FoodRecipeSearchResult Model.

class FoodRecipeSearchResult extends Model {
  int? id;
  String? name;
  String? age;
  String? imgUrl;

  FoodRecipeSearchResult();

  FoodRecipeSearchResult.fromJson(dynamic data) {
    id = data['id'];
    name = data['attributes']['name'];
    age = data['attributes']['age'];
    imgUrl = data['attributes']['img']['data']['attributes']['url'];
  }

  toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "imgUrl": imgUrl,
      };
}
