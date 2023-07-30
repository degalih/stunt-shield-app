import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/response/food_recipe_detail.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/customBulletedList.dart';
import 'package:flutter_app/resources/widgets/custom_back_button_widget.dart';
import 'package:flutter_app/resources/widgets/nutrition_card_item_widget.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class FoodRecipeDetailPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/food-recipe-detail';

  FoodRecipeDetailPage({Key? key}) : super(key: key);

  @override
  _FoodRecipeDetailPageState createState() => _FoodRecipeDetailPageState();
}

class _FoodRecipeDetailPageState extends NyState<FoodRecipeDetailPage> {
  @override
  init() async {
    super.init();
    print(widget.data());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coverHeight = 0.4 * MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NyFutureBuilder(
          future: _fetchRecipeDetail(widget.data()),
          child: (context, data) {
            FoodRecipeDetail? recipe = data as FoodRecipeDetail?;
            return ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.network(
                          recipe!.imgUrl ?? '-',
                          fit: BoxFit.cover,
                          height: coverHeight,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 20.0,
                          left: 20.0,
                          child: CustomBackButton(),
                        ),
                        Positioned(
                          bottom: coverHeight * -0.13,
                          child: Container(
                            width: width - 40.0,
                            child: Card(
                              surfaceTintColor: ThemeColor.get(context).white,
                              child: ListTile(
                                title: Text(
                                  recipe.name ?? '-',
                                  style: defaultTextTheme.titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 4.0,
                                      children: <Widget>[
                                        Image.network(
                                          recipe.recipe_source == "UNICEF"
                                              ? 'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690350694/Stunt%20Shield%20App%20Assets/unicef-logo_ro0lfd.png'
                                              : 'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178823/Stunt%20Shield%20App%20Assets/kemenkes_ouroof.png',
                                          height: 16.0,
                                        ),
                                        Text(
                                          recipe.recipe_source ?? '-',
                                          style: defaultTextTheme.labelSmall!
                                              .copyWith(
                                            color:
                                                ThemeColor.get(context).grey600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: ShapeDecoration(
                                        color: ThemeColor.get(context).grey300,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 4.0,
                                      children: <Widget>[
                                        Image.network(
                                          recipe.age == "Bumil"
                                              ? 'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725603/Stunt%20Shield%20App%20Assets/pregnant_duwbdi.png'
                                              : 'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178821/Stunt%20Shield%20App%20Assets/baby_r3dlbi.png',
                                          height: 16.0,
                                        ),
                                        Text(
                                          recipe.age ?? '-',
                                          style: defaultTextTheme.labelSmall!
                                              .copyWith(
                                            color:
                                                ThemeColor.get(context).grey600,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // if you need this
                      side: BorderSide(
                        color: ThemeColor.get(context).grey400,
                        width: 1,
                      ),
                    ),
                    elevation: 0,
                    child: ExpandedTile(
                      contentseparator: 0.0,
                      title: Text('Bahan - Bahan'),
                      controller: ExpandedTileController(isExpanded: true),
                      content: CustomBulletedList(
                        listItems: recipe.ingredients!,
                        bulletColor: ThemeColor.get(context).green,
                        style: defaultTextTheme.bodySmall!
                            .copyWith(color: ThemeColor.get(context).black),
                      ),
                      leading: Image.network(
                        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/ingredients_rimt3w.png',
                        height: 24.0,
                      ),
                      theme: ExpandedTileThemeData(
                        headerColor: ThemeColor.get(context).white,
                        contentBackgroundColor: ThemeColor.get(context).white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 0.0),
                        headerPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // if you need this
                      side: BorderSide(
                        color: ThemeColor.get(context).grey400,
                        width: 1,
                      ),
                    ),
                    elevation: 0,
                    child: ExpandedTile(
                      contentseparator: 0.0,
                      title: Text('Langkah - Langkah'),
                      controller: ExpandedTileController(isExpanded: false),
                      content: CustomBulletedList(
                        listItems: recipe.steps!,
                        bulletType: BulletType.numbered,
                        bulletColor: ThemeColor.get(context).yellow,
                        numberColor: ThemeColor.get(context).black,
                        style: defaultTextTheme.bodySmall!
                            .copyWith(color: ThemeColor.get(context).black),
                      ),
                      leading: Image.network(
                        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178822/Stunt%20Shield%20App%20Assets/process_w7rxk5.png',
                        height: 24.0,
                      ),
                      theme: ExpandedTileThemeData(
                        headerColor: ThemeColor.get(context).white,
                        contentBackgroundColor: ThemeColor.get(context).white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 0.0),
                        headerPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: ThemeColor.get(context).grey400,
                        width: 1,
                      ),
                    ),
                    elevation: 0,
                    child: ExpandedTile(
                      contentseparator: 0.0,
                      title: Text('Informasi Nutrisi'),
                      controller: ExpandedTileController(isExpanded: true),
                      leading: Image.network(
                        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/nutrition-facts-label_vduzec.png',
                        height: 24.0,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            surfaceTintColor: ThemeColor.get(context).blue50,
                            color: ThemeColor.get(context).blue50,
                            child: ListTile(
                              horizontalTitleGap: 4.0,
                              leading: Icon(
                                Icons.info_rounded,
                                color: ThemeColor.get(context).blue800,
                              ),
                              title: Text(
                                'Untuk memenuhi kebutuhan dalam sehari perlu ditambahkan 1-2 kali selingan.',
                                style: defaultTextTheme.labelSmall!.copyWith(
                                    color: ThemeColor.get(context).blue800),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              NutritionCardItem(
                                  imgUrl:
                                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/wheat_qw91rt.png',
                                  nutrition:
                                      '${recipe.nutritions!.choG}gram Karbohidrat'),
                              NutritionCardItem(
                                  imgUrl:
                                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/calories_1_rt9ce7.png',
                                  nutrition:
                                      '${recipe.nutritions!.choG}Kal Energi'),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              NutritionCardItem(
                                  imgUrl:
                                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/fat_1_hihtys.png',
                                  nutrition:
                                      '${recipe.nutritions!.fatG}gram Lemak'),
                              NutritionCardItem(
                                  imgUrl:
                                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690725073/Stunt%20Shield%20App%20Assets/chicken_azimwd.png',
                                  nutrition:
                                      '${recipe.nutritions!.proteinG}gram Protein'),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '*Komposisi gizi dihitung per ${recipe.large_portion}',
                            style: defaultTextTheme.labelSmall!.copyWith(
                              color: ThemeColor.get(context).grey600,
                            ),
                          ),
                          Text(
                            'sumber: ${recipe.nutrition_info_source}',
                            style: defaultTextTheme.labelSmall!.copyWith(
                              color: ThemeColor.get(context).grey600,
                            ),
                          ),
                          SizedBox(height: 16.0)
                        ],
                      ),
                      theme: ExpandedTileThemeData(
                        headerColor: ThemeColor.get(context).white,
                        contentBackgroundColor: ThemeColor.get(context).white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 0.0),
                        headerPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.0)
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.bookmark_add_outlined),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
    );
  }

  Future<FoodRecipeDetail>? _fetchRecipeDetail(int id) async {
    return await api<ApiService>((request) => request.getRecipeDetail(id));
  }
}
