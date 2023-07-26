import 'package:flutter_app/app/models/nutritions.dart';
import 'package:nylo_framework/nylo_framework.dart';

class FoodRecipeList extends Model {
  int? id;
  String? name;
  String? age;
  String? source;
  String? imgUrl;
  Nutritions? nutritions;

  FoodRecipeList();

  FoodRecipeList.fromJson(dynamic data) {
    id = data['id'];
    name = data['attributes']['name'];
    age = data['attributes']['age'];
    source = data['attributes']['source'];
    imgUrl = data['attributes']['img']['data']['attributes']['url'];
    nutritions = Nutritions.fromJson(data['attributes']['nutritions']);
  }

  toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "source": source,
        "imgUrl": imgUrl,
        "nutritions": nutritions,
      };
}
