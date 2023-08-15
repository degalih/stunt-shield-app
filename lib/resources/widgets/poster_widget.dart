import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/app/models/poster.dart' as Model;

class Poster extends StatefulWidget {
  Poster({Key? key}) : super(key: key);

  @override
  _PosterState createState() => _PosterState();
}

class _PosterState extends NyState<Poster> {
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return NyFutureBuilder(
        future: _loadPoster(),
        child: (context, data) {
          data as List<Model.Poster>;
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  horizontalTitleGap: 0,
                  title: Text('Poster',
                      style: defaultTextTheme.titleSmall!.copyWith(
                          color: _isDarkMode
                              ? ThemeColor.get(context).white
                              : ThemeColor.get(context).grey800,
                          fontWeight: FontWeight.w600)),
                  trailing: TextButton(
                    child: Text(
                      'Lihat Semua',
                      style: defaultTextTheme.bodySmall!.copyWith(
                          color: ThemeColor.get(context).yellow,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                  leading: SizedBox(
                    width: 6,
                    height: 20,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: ThemeColor.get(context).yellow),
                    ),
                  ),
                ),
                CarouselSlider(
                  options:
                      CarouselOptions(autoPlay: true, enlargeCenterPage: true),
                  items: data.map((poster) {
                    return Builder(builder: (BuildContext context) {
                      return FullScreenWidget(
                        backgroundColor: ThemeColor.get(context).white,
                        disposeLevel: DisposeLevel.Medium,
                        child: Center(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: Image.network(
                              poster.thumbnail ?? '-',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                )
              ],
            ),
          );
        });
  }

  Future<List<Model.Poster>?> _loadPoster() async {
    return await api<ApiService>((request) => request.fetchPoster());
  }
}
