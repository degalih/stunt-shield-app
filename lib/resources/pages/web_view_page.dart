import 'package:flutter/material.dart';
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
    final controller = WebViewController()
      ..loadRequest(Uri.parse(widget.data()));
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
