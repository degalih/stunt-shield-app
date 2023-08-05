import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
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
    return Card(
      surfaceTintColor: ThemeColor.get(context).white,
      child: ListTile(
        leading: Image.network(
          imgUrl,
          height: 24.0,
        ),
        title: Text(
          title,
          style: defaultTextTheme.bodySmall!.copyWith(
            color: ThemeColor.get(context).grey500,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: ThemeColor.get(context).grey500,
        ),
        onTap: () {
          routeTo(routePath);
        },
      ),
    );
  }
}
