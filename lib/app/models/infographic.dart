import 'package:nylo_framework/nylo_framework.dart';

class Infographic extends Model {
  int? id;
  String? thumbnail;
  String? source;
  Infographic();

  Infographic.fromJson(dynamic data) {
    id = data['id'];
    thumbnail = data['attributes']['img']['data']['attributes']['url'];
    source = data['attributes']['source'];
  }

  toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "source": source,
      };
}
