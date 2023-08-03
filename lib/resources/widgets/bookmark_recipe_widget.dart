import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/response/food_recipe_favorite.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/pages/food_recipe_detail_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/loader_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BookmarkRecipe extends StatefulWidget {
  BookmarkRecipe({Key? key}) : super(key: key);

  @override
  _BookmarkRecipeState createState() => _BookmarkRecipeState();
}

class _BookmarkRecipeState extends NyState<BookmarkRecipe> {
  List<FoodRecipeFavorite> favoriteRecipes = [];
  bool isFavoriteEmpty = false;

  void refreshData() {
    setState(() async {
      _fetchFavoriteRecipe();
    });
  }

  @override
  init() async {
    _fetchFavoriteRecipe();
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.get(context).grey50,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Daftar Resep Makanan Favorit',
              style: defaultTextTheme.titleLarge,
            ),
            isLoading(name: 'loadFavoriteRecipes')
                ? Expanded(child: Loader())
                : Expanded(
                    child: ListView.builder(
                      itemCount: isFavoriteEmpty ? 1 : favoriteRecipes.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (isFavoriteEmpty) {
                          return Text(
                            'Data favorit resep tidak ditemukan, tambahkan ke favorit terlebih dahulu!',
                            textAlign: TextAlign.center,
                          );
                        } else {
                          final recipe = favoriteRecipes[index];
                          return GestureDetector(
                            onTap: () {
                              // routeTo(FoodRecipeDetailPage.path,
                              //     data: recipe.recipeId);
                              Navigator.pushNamed(
                                      context, FoodRecipeDetailPage.path,
                                      arguments: recipe.recipeId)
                                  .then((_) {
                                _refreshData();
                              });
                            },
                            child: Card(
                              surfaceTintColor: ThemeColor.get(context).white,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8.0),
                                leading: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      recipe.imgUrl ?? '-',
                                      fit: BoxFit.cover,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  recipe.name ?? '-',
                                  style: defaultTextTheme.bodySmall,
                                ),
                                trailing: Badge(
                                  label: Text(
                                    recipe.age ?? '-',
                                  ),
                                  textStyle: defaultTextTheme.labelSmall!
                                      .copyWith(fontSize: 10),
                                  textColor: recipe.age == 'Bumil'
                                      ? ThemeColor.get(context).blue700
                                      : ThemeColor.get(context).yellow700,
                                  backgroundColor: recipe.age == 'Bumil'
                                      ? ThemeColor.get(context).blue50
                                      : ThemeColor.get(context).yellow50,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _fetchFavoriteRecipe() async {
    setLoading(true, name: 'loadFavoriteRecipes');
    favoriteRecipes =
        await api<ApiService>((request) => request.getFavoriteRecipe());

    if (favoriteRecipes.length == 0) {
      isFavoriteEmpty = true;
    } else {
      isFavoriteEmpty = false;
    }

    setLoading(false, name: 'loadFavoriteRecipes');
  }

  void _refreshData() {
    setState(() {
      _fetchFavoriteRecipe();
    });
  }
}
