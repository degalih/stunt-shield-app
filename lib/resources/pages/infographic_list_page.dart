import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/widgets/custom_back_button_widget.dart';
import '/app/controllers/controller.dart';
import 'package:stunt_shield_app/app/models/infographic.dart' as Model;

class InfographicListPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/infographic-list';

  InfographicListPage({Key? key}) : super(key: key);

  @override
  _InfographicListPageState createState() => _InfographicListPageState();
}

class _InfographicListPageState extends NyState<InfographicListPage> {
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
    return Scaffold(
      body: NyFutureBuilder(
          future: _loadPoster(),
          child: (context, data) {
            data as List<Model.Infographic>;
            return SafeArea(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomBackButton(),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 212 / 300,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return FullScreenWidget(
                              backgroundColor: ThemeColor.get(context).white,
                              disposeLevel: DisposeLevel.Medium,
                              child: Image.network(
                                data[index].thumbnail ?? '-',
                                fit: BoxFit.fitWidth,
                              ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<List<Model.Infographic>?> _loadPoster() async {
    return await api<ApiService>((request) => request.fetchInfoGraphic(100));
  }
}
