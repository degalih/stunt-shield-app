import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/pages/login_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class RegisterPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/register';

  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends NyState<RegisterPage> {
  bool isPasswordVisible = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmationPasswordController =
      TextEditingController();

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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Ayo Mulai!',
                            style: defaultTextTheme.labelLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Terlihat seperti Anda baru mengenal kami! Buat akun untuk mendapatkan pengalaman lengkap',
                                  style: defaultTextTheme.bodySmall!.copyWith(
                                    color: ThemeColor.get(context).grey600,
                                    fontSize: 9,
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 32.0,
                ),
                SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1688455229/Stunt%20Shield%20App%20Assets/register-ilus_gyz7qg.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator(),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 44.0,
                        child: TextField(
                          cursorHeight: 20.0,
                          controller: _firstNameController,
                          textAlignVertical: TextAlignVertical.top,
                          style: defaultTextTheme.labelLarge,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: ThemeColor.get(context).grey400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: ThemeColor.get(context).green),
                            ),
                            labelText: 'Nama Depan',
                            floatingLabelStyle: defaultTextTheme.bodySmall!
                                .copyWith(color: ThemeColor.get(context).green),
                            labelStyle: defaultTextTheme.labelLarge!.copyWith(
                                color: ThemeColor.get(context).grey400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Flexible(
                      child: SizedBox(
                        height: 44.0,
                        child: TextField(
                          cursorHeight: 20.0,
                          controller: _lastNameController,
                          textAlignVertical: TextAlignVertical.top,
                          style: defaultTextTheme.labelLarge,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: ThemeColor.get(context).grey400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: ThemeColor.get(context).green),
                            ),
                            labelText: 'Nama Belakang',
                            floatingLabelStyle: defaultTextTheme.bodySmall!
                                .copyWith(color: ThemeColor.get(context).green),
                            labelStyle: defaultTextTheme.labelLarge!.copyWith(
                                color: ThemeColor.get(context).grey400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
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
                    controller: _confirmationPasswordController,
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
                      labelText: 'Konfirmasi Kata Sandi',
                      floatingLabelStyle: defaultTextTheme.bodySmall!
                          .copyWith(color: ThemeColor.get(context).green),
                      labelStyle: defaultTextTheme.labelLarge!
                          .copyWith(color: ThemeColor.get(context).grey400),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2.0,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Daftar',
                    style: defaultTextTheme.labelLarge,
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
                        text: 'Sudah punya akun? ',
                      ),
                      TextSpan(
                          style:
                              TextStyle(color: ThemeColor.get(context).green),
                          text: 'Masuk',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              routeTo(
                                LoginPage.path,
                                navigationType: NavigationType.pushReplace,
                              );
                            }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
