import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/custom_back_button_widget.dart';
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
      body: ListView(
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
                    'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1688542441/large_mie_kelor_9c9ffb6e22.jpg',
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
                            'Nasi Tim Ayam Lele Cincang',
                            style: defaultTextTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4.0,
                                children: <Widget>[
                                  Image.network(
                                    'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178823/Stunt%20Shield%20App%20Assets/kemenkes_ouroof.png',
                                    height: 16.0,
                                  ),
                                  Text(
                                    'KEMENTERIAN KESEHATAN RI',
                                    style:
                                        defaultTextTheme.labelSmall!.copyWith(
                                      color: ThemeColor.get(context).grey600,
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
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4.0,
                                children: <Widget>[
                                  Image.network(
                                    'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178821/Stunt%20Shield%20App%20Assets/baby_r3dlbi.png',
                                    height: 16.0,
                                  ),
                                  Text(
                                    '6-8 Bulan',
                                    style:
                                        defaultTextTheme.labelSmall!.copyWith(
                                      color: ThemeColor.get(context).grey600,
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
                borderRadius: BorderRadius.circular(8), // if you need this
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
                content: Text(
                    'Qui reprehenderit quis occaecat veniam laboris mollit ea nostrud qui amet irure ipsum proident. Exercitation fugiat nulla dolore eu et pariatur culpa magna eu sint nostrud. Anim nisi nisi et aliqua ut occaecat exercitation voluptate sint sunt ut. Labore cillum nulla id cupidatat nostrud minim labore sit dolor incididunt tempor. Qui adipisicing reprehenderit quis quis non Lorem ut esse tempor est. Velit ullamco aliqua elit velit sunt ut pariatur pariatur laborum fugiat aliqua officia adipisicing ut. Lorem mollit cupidatat dolore nisi dolor veniam non fugiat velit nisi exercitation.'),
                leading: Image.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178822/Stunt%20Shield%20App%20Assets/ingredient_zywqlp.png',
                  height: 24.0,
                ),
                theme: ExpandedTileThemeData(
                  headerColor: ThemeColor.get(context).white,
                  contentBackgroundColor: ThemeColor.get(context).white,
                  contentPadding: EdgeInsets.all(16.0),
                  headerPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // if you need this
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
                content: Text(
                    'Qui reprehenderit quis occaecat veniam laboris mollit ea nostrud qui amet irure ipsum proident. Exercitation fugiat nulla dolore eu et pariatur culpa magna eu sint nostrud. Anim nisi nisi et aliqua ut occaecat exercitation voluptate sint sunt ut. Labore cillum nulla id cupidatat nostrud minim labore sit dolor incididunt tempor. Qui adipisicing reprehenderit quis quis non Lorem ut esse tempor est. Velit ullamco aliqua elit velit sunt ut pariatur pariatur laborum fugiat aliqua officia adipisicing ut. Lorem mollit cupidatat dolore nisi dolor veniam non fugiat velit nisi exercitation.'),
                leading: Image.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178822/Stunt%20Shield%20App%20Assets/process_w7rxk5.png',
                  height: 24.0,
                ),
                theme: ExpandedTileThemeData(
                  headerColor: ThemeColor.get(context).white,
                  contentBackgroundColor: ThemeColor.get(context).white,
                  contentPadding: EdgeInsets.all(16.0),
                  headerPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // if you need this
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
                content: Text(
                    'Qui reprehenderit quis occaecat veniam laboris mollit ea nostrud qui amet irure ipsum proident. Exercitation fugiat nulla dolore eu et pariatur culpa magna eu sint nostrud. Anim nisi nisi et aliqua ut occaecat exercitation voluptate sint sunt ut. Labore cillum nulla id cupidatat nostrud minim labore sit dolor incididunt tempor. Qui adipisicing reprehenderit quis quis non Lorem ut esse tempor est. Velit ullamco aliqua elit velit sunt ut pariatur pariatur laborum fugiat aliqua officia adipisicing ut. Lorem mollit cupidatat dolore nisi dolor veniam non fugiat velit nisi exercitation.'),
                leading: Image.network(
                  'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178822/Stunt%20Shield%20App%20Assets/pyramid_sjpkaf.png',
                  height: 24.0,
                ),
                theme: ExpandedTileThemeData(
                  headerColor: ThemeColor.get(context).white,
                  contentBackgroundColor: ThemeColor.get(context).white,
                  contentPadding: EdgeInsets.all(16.0),
                  headerPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.bookmark_add_outlined),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
    );
  }
}
