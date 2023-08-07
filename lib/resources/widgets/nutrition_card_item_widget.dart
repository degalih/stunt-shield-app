import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';

class NutritionCardItem extends StatelessWidget {
  final String imgUrl;
  final String nutrition;

  const NutritionCardItem(
      {Key? key, required this.imgUrl, required this.nutrition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;
    return Expanded(
      child: ListTile(
        visualDensity: VisualDensity(vertical: -4.0),
        contentPadding: EdgeInsets.all(4.0),
        minVerticalPadding: 0,
        horizontalTitleGap: 4.0,
        leading: Image.network(
          imgUrl,
          height: 32,
        ),
        title: Text(
          nutrition,
          style: defaultTextTheme.bodySmall!.copyWith(
              color: _isDarkMode
                  ? ThemeColor.get(context).white
                  : ThemeColor.get(context).black),
        ),
      ),
    );
  }
}
