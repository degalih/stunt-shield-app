import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/custom_back_button_widget.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.title, required this.child})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CustomBackButton(),
                title: Text(
                  title,
                  style: defaultTextTheme.titleLarge,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
