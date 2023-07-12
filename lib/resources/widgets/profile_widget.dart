import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends NyState<Profile> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ini adalah halaman Profil'),
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
      ],
    ));
  }
}
