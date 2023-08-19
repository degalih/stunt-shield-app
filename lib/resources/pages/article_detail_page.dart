import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:stunt_shield_app/app/models/article.dart';
import 'package:stunt_shield_app/app/utils/date_converter.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/resources/widgets/custom_back_button_widget.dart';
import '/app/controllers/controller.dart';

class ArticleDetailPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/article-detail';

  ArticleDetailPage({Key? key}) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends NyState<ArticleDetailPage> {
  late Article _article = Article();

  @override
  init() async {
    super.init();
    _article = widget.data();
    print(_article.createdAt);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomBackButton(),
                SizedBox(height: 16.0),
                Text(
                  _article.title ?? '-',
                  style: defaultTextTheme.titleLarge,
                ),
                Text(
                    '${_article.source} - ${DateConverter.parseToID(_article.createdAt ?? '2023-08-07T09:13:30.320Z')}'),
                Image.network(
                  _article.thumbnail ??
                      'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1691374264/1180194_720_c25660be33.jpg',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16.0),
                MarkdownBody(
                  data: _article.content ?? '-',
                  shrinkWrap: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
