import 'package:nylo_framework/nylo_framework.dart';

/// Article Model.

class Article extends Model {
  int? id;
  String? thumbnail;
  String? title;
  String? source;
  String? content;
  String? createdAt;

  Article();

  Article.fromJson(dynamic data) {
    id = data['id'];
    thumbnail = data['attributes']['thumbnail']['data']['attributes']['url'];
    title = data['attributes']['title'];
    source = data['attributes']['source'];
    content = data['attributes']['content'];
    createdAt = data['attributes']['createdAt'];
  }

  toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "title": title,
        "source": source,
        "content": content,
        "createdAt": createdAt,
      };
}
