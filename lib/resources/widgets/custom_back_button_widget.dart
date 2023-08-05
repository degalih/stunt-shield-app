import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColor.get(context).white,
      surfaceTintColor: ThemeColor.get(context).white,
      elevation: 4,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: ThemeColor.get(context).green,
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
