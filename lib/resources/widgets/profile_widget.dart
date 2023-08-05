import 'package:flutter/material.dart';
import 'package:stunt_shield_app/app/models/response/profile_me.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/pages/about_app_page.dart';
import 'package:stunt_shield_app/resources/pages/change_password_page.dart';
import 'package:stunt_shield_app/resources/pages/contact_helper_page.dart';
import 'package:stunt_shield_app/resources/pages/home_page.dart';
import 'package:stunt_shield_app/resources/pages/request_feature_page.dart';
import 'package:stunt_shield_app/resources/pages/theme_setting_page.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/resources/widgets/profile_card_button_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends NyState<Profile> {
  String appVersion = '-';
  @override
  init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.get(context).grey100,
      body: NyFutureBuilder(
          future: _fetchProfileData(),
          child: (context, data) {
            ProfileMe profileMe = data as ProfileMe;
            return ListView(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
              children: <Widget>[
                Text(
                  'Profil Saya',
                  style: defaultTextTheme.titleLarge,
                ),
                SizedBox(height: 16.0),
                Container(
                  height: 0.3 * MediaQuery.of(context).size.height,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        height: 0.2 * MediaQuery.of(context).size.height,
                        child: Card(
                          surfaceTintColor: ThemeColor.get(context).white,
                          elevation: 8.0,
                          color: ThemeColor.get(context).white,
                          child: ListTile(
                            title: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${profileMe.firstName} ${profileMe.lastName}',
                                      style: defaultTextTheme.titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text('${profileMe.email}',
                                        style: defaultTextTheme.titleMedium!
                                            .copyWith(
                                                color: ThemeColor.get(context)
                                                    .grey600)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Image.network(
                          'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691093171/Stunt%20Shield%20App%20Assets/user_b3k0go.png',
                          height: 140.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                ProfileCardButton(
                  imgUrl:
                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691095886/Stunt%20Shield%20App%20Assets/Leading-4_g5lu77.png',
                  title: 'Ganti Kata Sandi',
                  routePath: ChangePasswordPage.path,
                ),
                ProfileCardButton(
                  imgUrl:
                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691095886/Stunt%20Shield%20App%20Assets/Leading-3_z1skho.png',
                  title: 'Tema Aplikasi',
                  routePath: ThemeSettingPage.path,
                ),
                ProfileCardButton(
                  imgUrl:
                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691095886/Stunt%20Shield%20App%20Assets/Leading-2_dhbem3.png',
                  title: 'Kontak Bantuan',
                  routePath: ContactHelperPage.path,
                ),
                ProfileCardButton(
                  imgUrl:
                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691095886/Stunt%20Shield%20App%20Assets/Leading-1_gunhuy.png',
                  title: 'Request Feature',
                  routePath: RequestFeaturePage.path,
                ),
                ProfileCardButton(
                  imgUrl:
                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691095886/Stunt%20Shield%20App%20Assets/Leading_nf0sf8.png',
                  title: 'Tentang Aplikasi',
                  routePath: AboutAppPage.path,
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Text(
                    'Versi Aplikasi $appVersion',
                    style: defaultTextTheme.titleSmall!.copyWith(
                        color: ThemeColor.get(context).grey600,
                        fontWeight: FontWeight.bold),
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
                  onPressed: () async {
                    await Auth.remove();
                    if (await Auth.loggedIn() == false) {
                      routeTo(HomePage.path,
                          navigationType: NavigationType.pushAndForgetAll);
                    }
                  },
                  child: Text(
                    'Keluar',
                    style: defaultTextTheme.labelLarge,
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            );
          }),
    );
  }
}

Future<ProfileMe?> _fetchProfileData() async {
  return await api<ApiService>((request) => request.getProfileMe());
}
