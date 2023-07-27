import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';

class NutritionCardItem extends StatelessWidget {
  final String imgUrl;
  final String nutrition;

  const NutritionCardItem(
      {Key? key, required this.imgUrl, required this.nutrition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          style: defaultTextTheme.bodySmall,
        ),
      ),
    );
  }
}
