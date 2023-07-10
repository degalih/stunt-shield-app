import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class ProfilePage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/profile';

  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends NyState<ProfilePage> {
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
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ini adalah halaman profil'),
        SizedBox(
          height: 16,
        ),
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
            routeTo(HomePage.path,
                navigationType: NavigationType.pushAndForgetAll);
            User? user = await Auth.user<User>();
            print(user);
          },
          child: Text(
            'Keluar',
            style: defaultTextTheme.labelLarge,
          ),
        ),
      ],
    ));
  }
}
