import '/resources/pages/register_page.dart';
import '/resources/pages/login_page.dart';
import '/resources/pages/web_view_page.dart';

import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route(HomePage.path, (context) => HomePage());
      router.route(WebViewPage.path, (context) => WebViewPage());
      router.route(LoginPage.path, (context) => LoginPage());
      router.route(RegisterPage.path, (context) => RegisterPage());
      // Add your routes here

      // router.route(NewPage.path, (context) => NewPage(), transition: PageTransitionType.fade);
    });
