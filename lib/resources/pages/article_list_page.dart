import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/app/utils/date_converter.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/resources/widgets/custom_back_button_widget.dart';
import '/app/controllers/controller.dart';
import 'package:stunt_shield_app/app/models/article.dart' as Model;

class ArticleListPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/article-list';

  ArticleListPage({Key? key}) : super(key: key);

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends NyState<ArticleListPage> {
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
            data as List<Model.Article>;
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                              surfaceTintColor: ThemeColor.get(context).white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      data[index].thumbnail ?? '-',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      data[index].title ?? '-',
                                      style: defaultTextTheme.bodySmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      DateConverter.parseToID(
                                          data[index].createdAt ?? '-'),
                                      style: defaultTextTheme.labelSmall,
                                    ),
                                  ),
                                ],
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

  Future<List<Model.Article>?> _loadPoster() async {
    return await api<ApiService>((request) => request.fetchArticle(100));
  }
}
