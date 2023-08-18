import 'package:flutter/material.dart';
import 'package:stunt_shield_app/app/utils/dependency_injection.dart';
import '/bootstrap/app.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'bootstrap/boot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;
  runApp(
    AppBuild(
      navigatorKey: NyNavigator.instance.router.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
      initialRoute: nylo.getInitialRoute(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
    ),
  );
  DependencyInjection.init();
}
