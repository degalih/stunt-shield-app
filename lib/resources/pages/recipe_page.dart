import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/calculator_page.dart';
import 'package:flutter_app/resources/pages/favorite_page.dart';
import 'package:flutter_app/resources/pages/food_page.dart';
import 'package:flutter_app/resources/pages/profile_page.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '/app/controllers/controller.dart';
import 'search_page.dart';

class RecipePage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/recipe';

  RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends NyState<RecipePage> {
  int _currentIndex = 0;

  final List<Widget> _listWidget = <Widget>[
    FoodPage(),
    SearchPage(),
    CalculatorPage(),
    FavoritePage(),
    ProfilePage()
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
      appBar: AppBar(),
      body: SafeAreaWidget(
        child: Container(
          child: _listWidget[_currentIndex],
        ),
      ),
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
