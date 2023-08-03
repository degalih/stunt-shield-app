import 'package:nylo_framework/nylo_framework.dart';

class FavoriteId extends Model {
  int? favoriteId;

  FavoriteId();

  FavoriteId.fromJson(dynamic data) {
    favoriteId = data['id'];
  }

  toJson() => {
        "favoriteId": favoriteId,
      };
}
