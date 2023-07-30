import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/response/food_recipe_list.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/pages/food_recipe_detail_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/loader_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:nylo_framework/nylo_framework.dart';

class FoodRecipe extends StatefulWidget {
  FoodRecipe({Key? key}) : super(key: key);

  @override
  _FoodRecipeState createState() => _FoodRecipeState();
}

class _FoodRecipeState extends NyState<FoodRecipe> {
  final _scrollController = ScrollController();
  int page = 1;
  bool hasMore = true;

  List<FoodRecipeList>? recipes = [];
  @override
  init() async {
    super.init();
    _fetchRecipes();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _fetchRecipes();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshRecipes,
      child: Container(
        color: ThemeColor.get(context).grey50,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              titleSpacing: 24,
              title: Text(
                'Mau Masak Apa Hari Ini?',
                style: defaultTextTheme.titleLarge!
                    .copyWith(color: ThemeColor.get(context).black),
              ),
              backgroundColor: ThemeColor.get(context).grey50,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0 / 1.3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: recipes!.length + 1,
                itemBuilder: (context, index) {
                  if (index < recipes!.length) {
                    final recipe = recipes![index];
                    return GestureDetector(
                      onTap: () {
                        routeTo(FoodRecipeDetailPage.path, data: recipe.id);
                      },
                      child: Card(
                        color: ThemeColor.get(context).white,
                        surfaceTintColor: ThemeColor.get(context).white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(recipe.imgUrl ?? '-'),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x15000000),
                                        blurRadius: 3,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x2A000000),
                                        blurRadius: 3,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 4.0,
                                  right: 4.0,
                                  child: Badge(
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
                                )
                              ],
                            ),
                            Container(
                              height: 45.0,
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                recipe.name ?? '-',
                                style: defaultTextTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image.network(
                                        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/wheat_qw91rt.png',
                                        height: 24,
                                      ),
                                      Text(
                                        '${recipe.nutritions!.choG}g',
                                        style: defaultTextTheme.labelSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: ThemeColor.get(context)
                                                    .grey700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.network(
                                        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/fat_1_hihtys.png',
                                        height: 24,
                                      ),
                                      Text(
                                        '${recipe.nutritions!.fatG}g',
                                        style: defaultTextTheme.labelSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: ThemeColor.get(context)
                                                    .grey700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.network(
                                        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/calories_1_rt9ce7.png',
                                        height: 24,
                                      ),
                                      Text(
                                        '${recipe.nutritions!.energyKal}kal',
                                        style: defaultTextTheme.labelSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: ThemeColor.get(context)
                                                    .grey700),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.network(
                                        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/chicken_azimwd.png',
                                        height: 24,
                                      ),
                                      Text(
                                        '${recipe.nutritions!.proteinG}g',
                                        style: defaultTextTheme.labelSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: ThemeColor.get(context)
                                                    .grey700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return hasMore
                        ? Card(child: Center(child: Loader()))
                        : Card(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Lottie.network(
                                        'https://res.cloudinary.com/stunt-shield-cloudinary/raw/upload/v1690733549/Stunt%20Shield%20App%20Assets/no_more_data_knpiwy.json',
                                        height: 80),
                                    Text(
                                      'Tidak ada lagi data yang dapat dimuat',
                                      textAlign: TextAlign.center,
                                      style: defaultTextTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _fetchRecipes() async {
    if (isLoading(name: 'loadRecipes')) return;
    setLoading(true, name: 'loadRecipes');
    List<FoodRecipeList> recipeList =
        await api<ApiService>((request) => request.getAllFoodRecipes(page, 10));

    setState(() {
      page++;
      setLoading(false, name: 'loadRecipes');
      if (recipeList.length < 10) {
        hasMore = false;
      }
      recipes!.addAll(recipeList);
    });
  }

  Future _refreshRecipes() async {
    setState(() {
      setLoading(false, name: 'loadRecipes');
      hasMore = true;
      page = 1;
      recipes!.clear();
    });

    _fetchRecipes();
  }
}
