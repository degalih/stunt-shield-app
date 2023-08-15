import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/networking/api_service.dart';
import 'package:stunt_shield_app/app/utils/date_converter.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/pages/article_detail_page.dart';
import 'package:stunt_shield_app/resources/pages/article_list_page.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/app/models/article.dart' as Model;

class Article extends StatefulWidget {
  Article({Key? key}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends NyState<Article> {
  bool _isDarkMode = Backpack.instance.read('isDarkmode') ?? false;

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return NyFutureBuilder(
        future: _loadArticle(),
        child: (context, data) {
          data as List<Model.Article>;
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  horizontalTitleGap: 0,
                  title: Text('Berita Stunting Terkini',
                      style: defaultTextTheme.titleSmall!.copyWith(
                          color: _isDarkMode
                              ? ThemeColor.get(context).white
                              : ThemeColor.get(context).grey800,
                          fontWeight: FontWeight.w600)),
                  trailing: TextButton(
                    child: Text(
                      'Lihat Semua',
                      style: defaultTextTheme.bodySmall!.copyWith(
                          color: ThemeColor.get(context).green,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      routeTo(ArticleListPage.path);
                    },
                  ),
                  leading: SizedBox(
                    width: 6,
                    height: 20,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: ThemeColor.get(context).green),
                    ),
                  ),
                ),
                Column(
                  children: data
                      .map((article) => GestureDetector(
                            onTap: () {
                              routeTo(ArticleDetailPage.path, data: article);
                            },
                            child: ListTile(
                              leading: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Image.network(
                                  article.thumbnail ?? '-',
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                              ),
                              title: Text(
                                article.title ?? '-',
                                style: defaultTextTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                DateConverter.parseToID(
                                    article.createdAt ?? '-'),
                                style: defaultTextTheme.labelSmall,
                              ),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          );
        });
  }

  Future<List<Model.Article>?> _loadArticle() async {
    return await api<ApiService>((request) => request.fetchArticle(3));
  }
}
