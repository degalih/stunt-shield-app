import 'package:flutter/material.dart';
import 'package:stunt_shield_app/app/models/web_view_target.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '/app/controllers/controller.dart';

class WebViewPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/web-view';

  WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends NyState<WebViewPage> {
  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WebViewTarget data = widget.data();
    final controller = WebViewController()..loadRequest(Uri.parse(data.url!));
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name!),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: ThemeColor.get(context).white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
