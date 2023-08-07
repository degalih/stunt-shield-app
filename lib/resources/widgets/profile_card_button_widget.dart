import 'package:flutter/material.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ProfileCardButton extends StatelessWidget {
  const ProfileCardButton(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.routePath})
      : super(key: key);

  final String imgUrl;
  final String title;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;
    return Card(
      surfaceTintColor: _isDarkMode
          ? ThemeColor.get(context).dark200
          : ThemeColor.get(context).white,
      color: _isDarkMode
          ? ThemeColor.get(context).dark200
          : ThemeColor.get(context).white,
      child: ListTile(
        leading: Image.network(
          imgUrl,
          height: 24.0,
        ),
        title: Text(
          title,
          style: defaultTextTheme.bodySmall!.copyWith(
            color: _isDarkMode
                ? ThemeColor.get(context).grey300
                : ThemeColor.get(context).grey500,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: _isDarkMode
              ? ThemeColor.get(context).grey300
              : ThemeColor.get(context).grey500,
        ),
        onTap: () {
          routeTo(routePath);
        },
      ),
    );
  }
}
