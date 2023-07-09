import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/pages/register_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class LoginPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/login';

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {
  bool isPasswordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  init() async {
    super.init();
    isPasswordVisible = true;
  }

  @override
  void dispose() {
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
                Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ThemeColor.get(context).black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Selamat Datang Kembali!',
                          style: defaultTextTheme.labelLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Ayo Masuk',
                          style: defaultTextTheme.bodySmall!
                              .copyWith(color: ThemeColor.get(context).grey600),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 32.0,
                ),
                SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1688356447/Stunt%20Shield%20App%20Assets/login-illustration_epvqju.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator(),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
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
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: isPasswordVisible,
                    cursorHeight: 20.0,
                    controller: _passwordController,
                    textAlignVertical: TextAlignVertical.top,
                    style: defaultTextTheme.labelLarge,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: ThemeColor.get(context).grey400,
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
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
                      labelText: 'Kata Sandi',
                      floatingLabelStyle: defaultTextTheme.bodySmall!
                          .copyWith(color: ThemeColor.get(context).green),
                      labelStyle: defaultTextTheme.labelLarge!
                          .copyWith(color: ThemeColor.get(context).grey400),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                isLoading(name: 'loadLogin')
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
                        onPressed: () {
                          _login(
                              _emailController.text, _passwordController.text);
                        },
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
                          _login(
                              _emailController.text, _passwordController.text);
                        },
                        child: Text(
                          'Masuk',
                          style: defaultTextTheme.labelLarge,
                        ),
                      ),
                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 80.0,
                        color: ThemeColor.get(context).grey600,
                      ),
                    ),
                    Text('atau'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 80.0,
                        color: ThemeColor.get(context).grey600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          margin: const EdgeInsets.all(16.0),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 4.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: ThemeColor.get(context).grey400,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Lottie.network(
                                        'https://res.cloudinary.com/stunt-shield-cloudinary/raw/upload/v1688393467/Stunt%20Shield%20App%20Assets/under-construction-ilus_ywftja.json'),
                                    Text(
                                      'Fitur masih dalam proses pengerjaan',
                                      textAlign: TextAlign.center,
                                      style: defaultTextTheme.titleLarge!
                                          .copyWith(
                                              color: ThemeColor.get(context)
                                                  .grey600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: SvgPicture.network(
                    'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1688390287/Stunt%20Shield%20App%20Assets/google-logo_gtegfo.svg',
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  label: Text(
                    'Masuk dengan Google',
                    style: defaultTextTheme.titleSmall,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.get(context).white,
                    foregroundColor: ThemeColor.get(context).grey600,
                    surfaceTintColor: ThemeColor.get(context).white,
                    elevation: 4.0,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: defaultTextTheme.bodySmall,
                    children: <TextSpan>[
                      TextSpan(
                        style: TextStyle(
                          color: ThemeColor.get(context).grey600,
                        ),
                        text: 'Belum punya akun? ',
                      ),
                      TextSpan(
                          style:
                              TextStyle(color: ThemeColor.get(context).green),
                          text: 'Daftar ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              routeTo(
                                RegisterPage.path,
                                navigationType: NavigationType.pushReplace,
                              );
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(String identifier, String password) async {
    await validate(
      rules: {"email address": "email"},
      data: {"email address": identifier},
      onSuccess: () async {
        setLoading(true, name: 'loadLogin');
        User? user = await api<ApiService>(
            (request) => request.fetchUser(identifier, password),
            context: context);
        print(user?.toJson());
        setLoading(false, name: 'loadLogin');
      },
    );
  }
}
