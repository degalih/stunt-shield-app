import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;
    return Card(
      color: _isDarkMode
          ? ThemeColor.get(context).dark300
          : ThemeColor.get(context).white,
      surfaceTintColor: ThemeColor.get(context).white,
      elevation: 4,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: _isDarkMode
              ? ThemeColor.get(context).white
              : ThemeColor.get(context).green,
        ),
      ),
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }
}
