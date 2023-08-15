import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/app/models/infographic.dart' as Model;

class Infographic extends StatefulWidget {
  Infographic({Key? key}) : super(key: key);

  @override
  _InfographicState createState() => _InfographicState();
}

class _InfographicState extends NyState<Infographic> {
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return NyFutureBuilder(
        future: _loadInfoGraphic(),
        child: (context, data) {
          data as List<Model.Infographic>;
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  horizontalTitleGap: 0,
                  title: Text('Info Grafis',
                      style: defaultTextTheme.titleSmall!.copyWith(
                          color: _isDarkMode
                              ? ThemeColor.get(context).white
                              : ThemeColor.get(context).grey800,
                          fontWeight: FontWeight.w600)),
                  trailing: TextButton(
                    child: Text(
                      'Lihat Semua',
                      style: defaultTextTheme.bodySmall!.copyWith(
                          color: ThemeColor.get(context).blue,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                  leading: SizedBox(
                    width: 6,
                    height: 20,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: ThemeColor.get(context).blue),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 212 / 300,
                        child: FullScreenWidget(
                          disposeLevel: DisposeLevel.High,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Image.network(
                                data[index].thumbnail ?? '-',
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                      );
                    },
                    itemCount: data.length,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<List<Model.Infographic>?> _loadInfoGraphic() async {
    return await api<ApiService>((request) => request.fetchInfoGraphic());
  }
}
