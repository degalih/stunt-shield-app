import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:stunt_shield_app/resources/widgets/education_widget.dart';
import 'package:stunt_shield_app/resources/widgets/food_recipe_widget.dart';
import 'package:stunt_shield_app/resources/widgets/nutrition_calculator_widget.dart';
import 'package:stunt_shield_app/resources/widgets/profile_widget.dart';
import 'package:stunt_shield_app/resources/widgets/search_recipe_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stunt_shield_app/resources/widgets/show_case_view_widget.dart';
import '/app/controllers/controller.dart';

class MainPage extends NyStatefulWidget {
  final Controller controller = Controller();
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  static const path = '/main';

  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends NyState<MainPage> {
  int _currentIndex = 0;
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();

  final List<Widget> _listWidget = <Widget>[
    FoodRecipe(),
    SearchRecipe(),
    NutritionCalculator(),
    Education(),
    Profile(),
  ];

  @override
  init() async {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _isFirstLaunch().then((result) {
              if (result) {
                ShowCaseWidget.of(context)
                    .startShowCase([_four, _one, _two, _three]);
              }
            }));
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_currentIndex],
      bottomNavigationBar: ShowCaseView(
        globalKey: _four,
        title: 'Selamat Datang di Stunt Shield App',
        description: 'Mari ikuti panduan singkat berikut!',
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SalomonBottomBar(
            itemPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              SalomonBottomBarItem(
                activeIcon: SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373828/Stunt%20Shield%20App%20Assets/ep_food_hk2wjf.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                icon: SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373830/Stunt%20Shield%20App%20Assets/icon_5_qfut5u.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                title: Text(
                  'Resep',
                ),
              ),
              SalomonBottomBarItem(
                activeIcon: SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373828/Stunt%20Shield%20App%20Assets/carbon_search_ttyjkj.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                icon: ShowCaseView(
                  globalKey: _one,
                  title: 'Cari Resep Makanan',
                  description:
                      'Pada menu ini, anda dapat mencari resep makanan bergizi sesuai kata kunci yang dimasukkan',
                  child: SvgPicture.network(
                    'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373830/Stunt%20Shield%20App%20Assets/icon_3_qc0j5q.svg',
                    placeholderBuilder: (BuildContext context) => Container(
                      height: 16,
                      width: 16,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
                title: Text('Cari'),
              ),
              SalomonBottomBarItem(
                activeIcon: SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373828/Stunt%20Shield%20App%20Assets/2_ligugm.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                icon: ShowCaseView(
                  globalKey: _two,
                  title: 'Hitung Status Gizi Balita',
                  description:
                      'Pada menu ini tersedia fitur yang dapat menghitung status gizi balita anda termasuk dalam kategori stunting atau tidak',
                  child: SvgPicture.network(
                    'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373832/Stunt%20Shield%20App%20Assets/icon_12_cvotrn.svg',
                    placeholderBuilder: (BuildContext context) => Container(
                      height: 16,
                      width: 16,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
                title: Text('Hitung'),
              ),
              SalomonBottomBarItem(
                activeIcon: SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373829/Stunt%20Shield%20App%20Assets/fluent_news-16-filled_iwfjz2.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                icon: ShowCaseView(
                  globalKey: _three,
                  title: 'Edukasi',
                  description: 'Cari informasi seputar stunting disini',
                  child: SvgPicture.network(
                    'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373832/Stunt%20Shield%20App%20Assets/icon_7_ta63uw.svg',
                    placeholderBuilder: (BuildContext context) => Container(
                      height: 16,
                      width: 16,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
                title: Text('Edukasi'),
              ),
              SalomonBottomBarItem(
                activeIcon: SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691373828/Stunt%20Shield%20App%20Assets/iconamoon_profile-fill_kf5mhj.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                icon: SvgPicture.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1692020115/Stunt%20Shield%20App%20Assets/profile_icon_tvui9g.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                title: Text('Profil'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _isFirstLaunch() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstLaunch = sharedPreferences
            .getBool(MainPage.PREFERENCES_IS_FIRST_LAUNCH_STRING) ??
        true;

    if (isFirstLaunch)
      sharedPreferences.setBool(
          MainPage.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);

    return isFirstLaunch;
  }
}
