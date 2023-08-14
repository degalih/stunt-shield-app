import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/models/favorite_info.dart';
import 'package:stunt_shield_app/app/models/response/profile_me.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/app/utils/check_favorite_recipe.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';

class BookmarkButton extends StatefulWidget {
  final int recipeId;
  BookmarkButton({Key? key, required this.recipeId}) : super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends NyState<BookmarkButton> {
  bool isBookmarked = false;

  int favoriteId = 0;
  @override
  init() async {
    await _checkFavoriteInfo(widget.recipeId);
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        isBookmarked
            ? await _removeFromFavorite()
            : await _addToFavorite(widget.recipeId);
      },
      child: isBookmarked
          ? Icon(Icons.bookmark_added)
          : Icon(Icons.bookmark_add_outlined),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );
  }

  Future _checkFavoriteInfo(int recipeId) async {
    FavoriteInfo favoriteInfo = await checkFavoriteRecipe(recipeId);
    isBookmarked = favoriteInfo.isBookmarked;
    favoriteId = favoriteInfo.favoriteId;
  }

  Future<void> _addToFavorite(int recipeId) async {
    ProfileMe profileMe =
        await api<ApiService>((request) => request.getProfileMe());
    await api<ApiService>(
        (request) => request.addFavoriteRecipe(profileMe.id!, recipeId));
    setState(() {
      isBookmarked = !isBookmarked;
    });
    const snackBar = SnackBar(
      content: Text('Resep Berhasil Ditambahkan!'),
    );
    await ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _removeFromFavorite() async {
    await api<ApiService>(
        (request) => request.removeFavoriteRecipe(favoriteId));
    setState(() {
      isBookmarked = !isBookmarked;
    });
    const snackBar = SnackBar(
      content: Text('Resep Berhasil Dihapus!'),
    );
    await ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
