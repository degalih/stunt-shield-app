import 'package:flutter/material.dart';
import 'package:stunt_shield_app/resources/widgets/bookmark_recipe_widget.dart';
import 'package:stunt_shield_app/resources/widgets/food_recipe_widget.dart';
import 'package:stunt_shield_app/resources/widgets/nutrition_calculator_widget.dart';
import 'package:stunt_shield_app/resources/widgets/profile_widget.dart';
import 'package:stunt_shield_app/resources/widgets/search_recipe_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '/app/controllers/controller.dart';

class MainPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/main';

  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends NyState<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _listWidget = <Widget>[
    FoodRecipe(),
    SearchRecipe(),
    NutritionCalculator(),
    BookmarkRecipe(),
    Profile(),
  ];

  @override
  init() async {
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
      bottomNavigationBar: SalomonBottomBar(
        itemPadding: EdgeInsets.all(16.0),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Resep'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text('Cari'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.calculate),
            title: Text('Hitung'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Favorit'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
      ),
    );
  }
}
