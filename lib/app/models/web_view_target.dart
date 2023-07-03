import 'package:nylo_framework/nylo_framework.dart';

/// WebViewTarget Model.

class WebViewTarget extends Model {
  String? name;
  String? url;

  WebViewTarget();

  WebViewTarget.fromJson(data) {
    name = data['name'];
    url = data['url'];
  }

  toJson() => {"name": name, "url": url};
}
