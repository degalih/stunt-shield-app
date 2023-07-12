import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class FoodRecipe extends StatefulWidget {
  FoodRecipe({Key? key}) : super(key: key);

  @override
  _FoodRecipeState createState() => _FoodRecipeState();
}

class _FoodRecipeState extends NyState<FoodRecipe> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ini adalah halaman resep makanan'),
        ],
      ),
    );
  }
}
