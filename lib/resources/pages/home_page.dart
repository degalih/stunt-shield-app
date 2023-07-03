import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/web_view_target.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/pages/web_view_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app/controllers/home_controller.dart';
import '/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const path = '/';

  @override
  final HomeController controller = HomeController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends NyState<HomePage> {
  bool _darkMode = false;

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWidget(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Logo(),
                  SvgPicture.network(
                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1687707417/Stunt%20Shield%20App%20Assets/toodler-ilus_moqji2.svg',
                      placeholderBuilder: (BuildContext context) => Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const CircularProgressIndicator())),
                  SizedBox(height: 32),
                  Text('Selamat Datang!').displayMedium(context),
                  Text("Bergabunglah dengan kami sekarang buat akun atau masuk",
                          textAlign: TextAlign.center)
                      .bodySmall(context)
                      .setColor(
                          context,
                          (color) =>
                              _darkMode == true ? color.grey50 : color.grey600),
                  SizedBox(
                    height: 32.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2.0,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    onPressed: () {},
                    child: Text(
                      'Masuk',
                      style: defaultTextTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    onPressed: () {},
                    child: Text(
                      'Daftar',
                      style: defaultTextTheme.labelLarge,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: defaultTextTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          style:
                              TextStyle(color: ThemeColor.get(context).grey600),
                          text: 'Dengan mendaftar, Anda menyetujui ',
                        ),
                        TextSpan(
                            style:
                                TextStyle(color: ThemeColor.get(context).green),
                            text: 'Perjanjian Pengguna ',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                WebViewTarget data = new WebViewTarget();
                                data.name = "Perjanjian Pengguna";
                                data.url =
                                    "https://github.com/degalih/stunt-shield-docs/blob/main/user-aggrement-id.md";
                                routeTo(WebViewPage.path, data: data);
                              }),
                        TextSpan(
                            style: TextStyle(
                                color: ThemeColor.get(context).grey600),
                            text: 'dan '),
                        TextSpan(
                            style:
                                TextStyle(color: ThemeColor.get(context).green),
                            text: 'Kebijakan Privasi ',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                WebViewTarget data = new WebViewTarget();
                                data.name = "Kebijakan Privasi";
                                data.url =
                                    "https://github.com/degalih/stunt-shield-docs/blob/main/privacy-policy-id.md";
                                routeTo(WebViewPage.path, data: data);
                              }),
                        TextSpan(
                            style: TextStyle(
                                color: ThemeColor.get(context).grey600),
                            text: 'kami'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
