import 'package:nylo_framework/nylo_framework.dart';

class FoodRecipeFavorite extends Model {
  int? favoriteId;
  int? recipeId;
  int? userId;
  String? name;
  String? age;
  String? imgUrl;

  FoodRecipeFavorite();

  FoodRecipeFavorite.fromJson(dynamic data) {
    favoriteId = data['id'];
    recipeId = data['attributes']['recipes']['data']['id'];
    userId = data['attributes']['user']['data']['id'];
    name = data['attributes']['recipes']['data']['attributes']['name'];
    age = data['attributes']['recipes']['data']['attributes']['age'];
    imgUrl = data['attributes']['recipes']['data']['attributes']['img']['data']
        ['attributes']['url'];
  }

  toJson() => {
        "favoriteId": favoriteId,
        "recipeId": recipeId,
        "userId": userId,
        "name": name,
        "age": age,
        "imgUrl": imgUrl,
      };
}
