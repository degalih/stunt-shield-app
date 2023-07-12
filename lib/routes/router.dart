import 'package:flutter/material.dart';

import '/resources/pages/recipe_page.dart';
import '/resources/pages/register_page.dart';
import '/resources/pages/login_page.dart';
import '/resources/pages/web_view_page.dart';

import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

appRouter() => nyRoutes((router) async {
      router.route(HomePage.path, (context) => HomePage(), initialRoute: true);
      router.route(WebViewPage.path, (context) => WebViewPage());
      router.route(LoginPage.path, (context) => LoginPage());
      router.route(RegisterPage.path, (context) => RegisterPage());
      router.route(
        RecipePage.path,
        (context) => RecipePage(),
        routeGuards: [AuthRouteGuard()],
        authPage: true,
      );
    });

class AuthRouteGuard extends NyRouteGuard {
  AuthRouteGuard();

  @override
  Future<bool> canOpen(BuildContext? context, NyArgument? data) async {
    return (await Auth.loggedIn());
  }

  @override
  redirectTo(BuildContext? context, NyArgument? data) async {
    await routeTo(HomePage.path);
  }
}
