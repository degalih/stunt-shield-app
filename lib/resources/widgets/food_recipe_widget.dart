import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/response/food_recipe_list.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/pages/food_recipe_detail_page.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
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
    return SingleChildScrollView(
      child: NyFutureBuilder(
        future: _fetchRecipes(),
        child: (context, data) {
          List<FoodRecipeList>? recipes = data as List<FoodRecipeList>?;
          return Container(
            color: ThemeColor.get(context).grey50,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mau Masak Apa Hari Ini?',
                    style: defaultTextTheme.titleLarge,
                  ),
                  GridView.count(
                    padding: EdgeInsets.all(0.0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 1.0 / 1.3,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 8.0,
                    children: <Widget>[
                      ...recipes!.map(
                        (recipe) => GestureDetector(
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
                                          image: NetworkImage(
                                              recipe.imgUrl ?? '-'),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
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
                                                    color:
                                                        ThemeColor.get(context)
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
                                                    color:
                                                        ThemeColor.get(context)
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
                                                    color:
                                                        ThemeColor.get(context)
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
                                                    color:
                                                        ThemeColor.get(context)
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
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<List<FoodRecipeList>?> _fetchRecipes() async {
    return await api<ApiService>((request) => request.getAllFoodRecipes());
  }
}
