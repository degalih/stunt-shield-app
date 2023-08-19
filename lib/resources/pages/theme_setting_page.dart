import 'package:flutter/material.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/resources/widgets/custom_back_button_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';
import '/app/controllers/controller.dart';

class ThemeSettingPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/theme-setting';

  ThemeSettingPage({Key? key}) : super(key: key);

  @override
  _ThemeSettingPageState createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends NyState<ThemeSettingPage> {
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;
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
      backgroundColor: _isDarkMode
          ? ThemeColor.get(context).dark100
          : ThemeColor.get(context).white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CustomBackButton(),
                title: Text(
                  'Tema Aplikasi',
                  style: defaultTextTheme.titleLarge!.copyWith(
                      color: _isDarkMode
                          ? ThemeColor.get(context).white
                          : ThemeColor.get(context).black),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Card(
                surfaceTintColor: _isDarkMode
                    ? ThemeColor.get(context).dark300
                    : ThemeColor.get(context).white,
                color: _isDarkMode
                    ? ThemeColor.get(context).dark300
                    : ThemeColor.get(context).white,
                elevation: 4,
                child: SwitchListTile(
                  activeColor: ThemeColor.get(context).green500,
                  title: _isDarkMode ? Text('Gelap') : Text('Terang'),
                  value: _isDarkMode,
                  onChanged: (bool value) async {
                    _isDarkMode = value;
                    await NyStorage.store('isDarkmode', value,
                        inBackpack: true);
                    NyTheme.set(context,
                        id: getEnv(Backpack.instance.read('isDarkmode') == true
                            ? 'DARK_THEME_ID'
                            : 'LIGHT_THEME_ID'));
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
