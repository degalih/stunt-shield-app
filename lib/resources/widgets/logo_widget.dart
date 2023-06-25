import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.height, this.width}) : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
        'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1687706123/Stunt%20Shield%20App%20Assets/logo-with-tagline_g5j7hk.svg',
        height: height ?? 224,
        width: width ?? 105,
        placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator()));
  }
}
