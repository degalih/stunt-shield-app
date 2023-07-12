import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BookmarkRecipe extends StatefulWidget {
  BookmarkRecipe({Key? key}) : super(key: key);

  @override
  _BookmarkRecipeState createState() => _BookmarkRecipeState();
}

class _BookmarkRecipeState extends NyState<BookmarkRecipe> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ini adalah halaman favorit resep'),
    );
  }
}
