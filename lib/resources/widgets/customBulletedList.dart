import 'package:flutter/material.dart';
import 'package:stunt_shield_app/resources/themes/text_theme/default_text_theme.dart';

enum ListOrder {
  unordered,
  ordered,
}

enum BulletType {
  numbered,
  conventional,
}

/// Flutter widget that defines both *unordered lists* of Widgets and *ordered
/// lists* of Strings of text with a default round bullet preceding each item.
///

class CustomBulletedList extends StatelessWidget {
  /// Required. [listItems] may be a list of Strings or a list of Widgets
  final List<dynamic> listItems;

  /// Optional. Additional styling for a String item. Ignored for Widget items.
  final TextStyle? style;

  /// Optional. If this widget is not specified, a default dark circle is used.
  final Widget? bullet;

  /// Optional. Applicable only for String items. Ignored for Widget items.
  final ListOrder listOrder;

  /// Optional. Color for the default bullet. Ignored if [bullet] above is specified.
  final Color bulletColor;

  /// Optional. Cross axis alignment of the items list. Center is default.
  final CrossAxisAlignment crossAxisAlignment;

  /// Optional. Specify BulletType.numbered to generate a numbered list. Conventional is the default.
  final BulletType bulletType;

  /// Optional. Specify text color for the number in numbered bullet.
  final Color numberColor;

  /// Optional. Specify shape of the default bullet. Circle is the default.
  final BoxShape boxShape;

  const CustomBulletedList({
    Key? key,
    required this.listItems,
    this.style,
    this.bullet,
    this.listOrder = ListOrder.unordered,
    this.bulletColor = Colors.blueGrey,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.bulletType = BulletType.conventional,
    this.numberColor = Colors.white,
    this.boxShape = BoxShape.circle,
  }) : super(key: key);

  Widget _bullet(BuildContext context) {
    return bullet ??
        Container(
          height: 8,
          width: 8,
          decoration: new BoxDecoration(
            color: bulletColor,
            shape: boxShape,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget _numberedBullet(dynamic item) {
      final int number = 1 + listItems.indexWhere((e) => e == item);
      if (number < 1) {
        return _bullet(context);
      }
      final double boxSize = 10 + (1.0 * listItems.length);
      return Container(
        alignment: Alignment.center,
        height: boxSize,
        width: boxSize,
        decoration: new BoxDecoration(
          color: bulletColor,
          shape: boxShape,
        ),
        child: Text(
          number.toString(),
          style: defaultTextTheme.bodySmall!.copyWith(
              fontSize: 10, color: numberColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (listOrder == ListOrder.ordered && listItems is List<String>) {
      listItems.sort((a, b) => a.compareTo(b));
    }

    return Container(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: listItems
            .map(
              (item) => ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  minLeadingWidth: 10,
                  leading: bulletType == BulletType.conventional
                      ? _bullet(context)
                      : _numberedBullet(item),
                  title: item == null
                      ? Text(
                          '',
                          style: defaultTextTheme.bodySmall!.merge(style),
                        )
                      : item is String
                          ? Text(item,
                              style: defaultTextTheme.bodySmall!.merge(style))
                          : item is Widget
                              ? item
                              : Text(
                                  'Error: Only Widget/String allowed:\n' +
                                      item.toString(),
                                )),
            )
            .toList(),
      ),
    );
  }
}
