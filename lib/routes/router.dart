import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/food_recipe_detail_page.dart';
import 'package:flutter_app/resources/pages/main_page.dart';
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
        MainPage.path,
        (context) => MainPage(),
        routeGuards: [AuthRouteGuard()],
        authPage: true,
      );
      router.route(
        FoodRecipeDetailPage.path,
        (context) => FoodRecipeDetailPage(),
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
