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
  bool isDarkMode = false;
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
                  style: defaultTextTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Card(
                surfaceTintColor: ThemeColor.get(context).white,
                elevation: 4,
                child: SwitchListTile(
                  title: Text('Terang'),
                  value: isDarkMode,
                  onChanged: (bool value) {
                    isDarkMode = value;
                    NyTheme.set(context,
                        id: getEnv(isDarkMode == true
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
