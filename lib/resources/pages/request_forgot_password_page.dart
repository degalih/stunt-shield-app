import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class RequestForgotPasswordPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/request-forgot-password';

  RequestForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _RequestForgotPasswordPageState createState() =>
      _RequestForgotPasswordPageState();
}

class _RequestForgotPasswordPageState
    extends NyState<RequestForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    _emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWidget(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.arrow_back_ios,
                    color: ThemeColor.get(context).black,
                  ),
                  title: Text(
                    'Lupa Kata Sandi',
                    style: defaultTextTheme.labelLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Masukkan email anda untuk menerima konfirmasi reset!',
                    style: defaultTextTheme.bodySmall!
                        .copyWith(color: ThemeColor.get(context).grey600),
                  ),
                ),
                SizedBox(height: 32.0),
                SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691179070/Stunt%20Shield%20App%20Assets/Forgot_password-cuate_am0jwd.svg',
                  height: 200.0,
                  placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator(),
                  ),
                ),
                SizedBox(height: 32.0),
                SizedBox(
                  height: 44.0,
                  child: TextField(
                    cursorHeight: 20.0,
                    controller: _emailController,
                    textAlignVertical: TextAlignVertical.top,
                    style: defaultTextTheme.labelLarge,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: ThemeColor.get(context).grey400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: ThemeColor.get(context).green),
                      ),
                      labelText: 'Email',
                      floatingLabelStyle: defaultTextTheme.bodySmall!
                          .copyWith(color: ThemeColor.get(context).green),
                      labelStyle: defaultTextTheme.labelLarge!
                          .copyWith(color: ThemeColor.get(context).grey400),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                isLoading(name: 'loadButton')
                    ? ElevatedButton.icon(
                        icon: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 2.0,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {},
                        label: Text(
                          'Loading...',
                          style: defaultTextTheme.labelLarge,
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2.0,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          _sendEmail(_emailController.text);
                        },
                        child: Text(
                          'Kirim',
                          style: defaultTextTheme.labelLarge,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendEmail(String email) async {
    await validate(
      rules: {"email address": "email"},
      data: {"email address": email},
      onSuccess: () async {
        setLoading(true, name: 'loadButton');
        if (await api<ApiService>(
                (request) => request.requestResetPasswod(email),
                context: context) ==
            true) {
          const snackBar = SnackBar(
            content: Text(
                'Email Reset berhasil dikirim!. Buka kotak masuk email anda segera'),
          );
          await ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
          setLoading(false, name: 'loadButton');
        }
      },
    );
  }
}
