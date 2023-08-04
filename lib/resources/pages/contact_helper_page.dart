import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/custom_scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class ContactHelperPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/contact-helper';

  ContactHelperPage({Key? key}) : super(key: key);

  @override
  _ContactHelperPageState createState() => _ContactHelperPageState();
}

class _ContactHelperPageState extends NyState<ContactHelperPage> {
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
      title: 'Kontak Bantuan',
      child: Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            'Butuh bantuan? Ingin berbicara dengan seseorang? Hubungi kami langsung melalui nomor telepon atau alamat email yang tertera. Kami senang mendengar suara Anda.',
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
              'galihmramdan17@gmail.com',
              style: defaultTextTheme.bodySmall!
                  .copyWith(color: ThemeColor.get(context).grey600),
            ),
          ),
          ListTile(
            horizontalTitleGap: 8,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.phone_android_outlined,
              color: ThemeColor.get(context).grey600,
            ),
            title: Text(
              '+6289674720241',
              style: defaultTextTheme.bodySmall!
                  .copyWith(color: ThemeColor.get(context).grey600),
            ),
          ),
        ],
      ),
    );
  }
}
