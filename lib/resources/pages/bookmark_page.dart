import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/models/response/food_recipe_favorite.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/pages/food_recipe_detail_page.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/resources/widgets/custom_back_button_widget.dart';
import 'package:stunt_shield_app/resources/widgets/loader_widget.dart';
import '/app/controllers/controller.dart';

class BookmarkPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/bookmark';

  BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends NyState<BookmarkPage> {
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;
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
    return Scaffold(
      body: Container(
        color: _isDarkMode
            ? ThemeColor.get(context).dark100
            : ThemeColor.get(context).grey50,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CustomBackButton(),
                  SizedBox(width: 8.0),
                  Text(
                    'Resep Makanan Favorit',
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextTheme.titleLarge!.copyWith(
                      color: _isDarkMode
                          ? ThemeColor.get(context).white
                          : ThemeColor.get(context).black,
                    ),
                  ),
                ],
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
                                surfaceTintColor: _isDarkMode
                                    ? ThemeColor.get(context).dark200
                                    : ThemeColor.get(context).white,
                                color: _isDarkMode
                                    ? ThemeColor.get(context).dark200
                                    : ThemeColor.get(context).white,
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
