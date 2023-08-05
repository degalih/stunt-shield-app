import 'package:flutter/material.dart';
import 'package:stunt_shield_app/bootstrap/helpers.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:stunt_shield_app/resources/widgets/custom_scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class RequestFeaturePage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/request-feature';

  RequestFeaturePage({Key? key}) : super(key: key);

  @override
  _RequestFeaturePageState createState() => _RequestFeaturePageState();
}

class _RequestFeaturePageState extends NyState<RequestFeaturePage> {
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
    return CustomScaffold(
      title: 'Request Feature',
      child: Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            'Kirimkan permintaan fitur dengan mengirimkan email berupa kritik atau saran untuk aplikasi yang lebih baik di masa mendatang.',
            textAlign: TextAlign.justify,
            style: defaultTextTheme.bodySmall!
                .copyWith(color: ThemeColor.get(context).grey600),
          ),
          ListTile(
            horizontalTitleGap: 8,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.email_outlined,
              color: ThemeColor.get(context).grey600,
            ),
            title: Text(
              'stuntshield@gmail.com',
              style: defaultTextTheme.bodySmall!
                  .copyWith(color: ThemeColor.get(context).grey600),
            ),
          ),
        ],
      ),
    );
  }
}
