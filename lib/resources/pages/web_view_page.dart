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
  WebViewController controller = WebViewController();
  @override
  init() async {
    super.init();
    WebViewTarget data = widget.data();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(data.url!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WebViewTarget data = widget.data();
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
      body: WebViewWidget(controller: controller),
    );
  }
}
