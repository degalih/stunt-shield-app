import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';

import 'package:stunt_shield_app/resources/widgets/article_widget.dart';
import 'package:stunt_shield_app/resources/widgets/infographic_widget.dart';
import 'package:stunt_shield_app/resources/widgets/poster_widget.dart';

class Education extends StatefulWidget {
  Education({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends NyState<Education> {
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Poster(),
            SizedBox(
              width: double.infinity,
              height: 8.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: _isDarkMode
                        ? ThemeColor.get(context).dark200
                        : ThemeColor.get(context).grey200),
              ),
            ),
            Article(),
            SizedBox(
              width: double.infinity,
              height: 8.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: _isDarkMode
                        ? ThemeColor.get(context).dark200
                        : ThemeColor.get(context).grey200),
              ),
            ),
            Infographic(),
            SizedBox(
              width: double.infinity,
              height: 8.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: _isDarkMode
                        ? ThemeColor.get(context).dark200
                        : ThemeColor.get(context).grey200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
