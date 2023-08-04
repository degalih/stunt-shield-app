import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/custom_scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class ChangePasswordPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/change-password';

  ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends NyState<ChangePasswordPage> {
  bool isPasswordVisible = false;
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _userNewPassword = TextEditingController();
  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    _currentPassword.clear();
    _password.clear();
    _userNewPassword.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Ganti Kata Sandi',
      child: Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          SizedBox(
            height: 44.0,
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: isPasswordVisible,
              cursorHeight: 20.0,
              controller: _currentPassword,
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
                  borderSide: BorderSide(color: ThemeColor.get(context).green),
                ),
                labelText: 'Kata Sandi Lama',
                floatingLabelStyle: defaultTextTheme.bodySmall!
                    .copyWith(color: ThemeColor.get(context).green),
                labelStyle: defaultTextTheme.labelLarge!
                    .copyWith(color: ThemeColor.get(context).grey400),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 44.0,
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: isPasswordVisible,
              cursorHeight: 20.0,
              controller: _password,
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
                  borderSide: BorderSide(color: ThemeColor.get(context).green),
                ),
                labelText: 'Kata Sandi Baru',
                floatingLabelStyle: defaultTextTheme.bodySmall!
                    .copyWith(color: ThemeColor.get(context).green),
                labelStyle: defaultTextTheme.labelLarge!
                    .copyWith(color: ThemeColor.get(context).grey400),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 44.0,
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: isPasswordVisible,
              cursorHeight: 20.0,
              controller: _userNewPassword,
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
                  borderSide: BorderSide(color: ThemeColor.get(context).green),
                ),
                labelText: 'Ulangi Kata Sandi Baru',
                floatingLabelStyle: defaultTextTheme.bodySmall!
                    .copyWith(color: ThemeColor.get(context).green),
                labelStyle: defaultTextTheme.labelLarge!
                    .copyWith(color: ThemeColor.get(context).grey400),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          isLoading(name: 'changePassword')
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
                    _changePassword(
                        _currentPassword.text, _userNewPassword.text);
                  },
                  child: Text(
                    'Ganti Kata Sandi',
                    style: defaultTextTheme.labelLarge,
                  ),
                ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Future<void> _changePassword(
      String currentPassword, String userNewPassword) async {
    await validate(
      rules: {
        "Kata Sandi Lama": "not_empty",
        "Kata Sandi Baru": "not_empty",
        "Ulangi Kata Sandi Baru": "not_empty",
      },
      data: {
        "Kata Sandi Lama": currentPassword,
        "Kata Sandi Baru": _password.text,
        "Ulangi Kata Sandi Baru": userNewPassword,
      },
      onSuccess: () async {
        setLoading(true, name: 'changePassword');
        Future.delayed(Duration(seconds: 3));
        setLoading(false, name: 'changePassword');
      },
    );
  }
}
