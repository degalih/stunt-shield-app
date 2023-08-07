import 'package:flutter/material.dart';
import 'package:stunt_shield_app/app/models/response/food_recipe_search_result.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/pages/food_recipe_detail_page.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/resources/widgets/loader_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SearchRecipe extends StatefulWidget {
  SearchRecipe({Key? key}) : super(key: key);

  @override
  _SearchRecipeState createState() => _SearchRecipeState();
}

class _SearchRecipeState extends NyState<SearchRecipe> {
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;
  List<FoodRecipeSearchResult> recipes = [];
  bool isResultEmpty = false;

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _isDarkMode
          ? ThemeColor.get(context).dark100
          : ThemeColor.get(context).grey50,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Cari Resep Makanan Disini',
              style: defaultTextTheme.titleLarge!.copyWith(
                  color: _isDarkMode
                      ? ThemeColor.get(context).white
                      : ThemeColor.get(context).black),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: _isDarkMode
                    ? ThemeColor.get(context).dark200
                    : ThemeColor.get(context).grey200,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                hintText: 'ex: Bubur',
                hintStyle: defaultTextTheme.bodySmall!.copyWith(
                    color: _isDarkMode
                        ? ThemeColor.get(context).white
                        : ThemeColor.get(context).grey600),
                prefixIcon: Icon(
                  Icons.search,
                ),
                prefixIconColor: _isDarkMode
                    ? ThemeColor.get(context).white
                    : ThemeColor.get(context).grey600,
              ),
              onSubmitted: (query) {
                _fetchSearchRecipe(query);
              },
            ),
            isLoading(name: 'loadSearchRecipes')
                ? Expanded(child: Loader())
                : Expanded(
                    child: ListView.builder(
                      itemCount: isResultEmpty ? 1 : recipes.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (isResultEmpty) {
                          return Text('Data resep tidak ditemukan:(');
                        } else {
                          final recipe = recipes[index];
                          return GestureDetector(
                            onTap: () {
                              routeTo(FoodRecipeDetailPage.path,
                                  data: recipe.id);
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
    );
  }

  void _fetchSearchRecipe(String query) async {
    setLoading(true, name: 'loadSearchRecipes');
    recipes.clear();
    List<FoodRecipeSearchResult> recipeListResult =
        await api<ApiService>((request) => request.searchRecipes(query));

    if (recipeListResult.length == 0) {
      isResultEmpty = true;
    } else {
      recipes.addAll(recipeListResult);
      isResultEmpty = false;
    }

    setLoading(false, name: 'loadSearchRecipes');
  }
}
