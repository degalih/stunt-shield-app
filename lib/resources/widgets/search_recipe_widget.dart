import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SearchRecipe extends StatefulWidget {
  SearchRecipe({Key? key}) : super(key: key);

  @override
  _SearchRecipeState createState() => _SearchRecipeState();
}

class _SearchRecipeState extends NyState<SearchRecipe> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ini adalah halaman cari resep'),
    );
  }
}
