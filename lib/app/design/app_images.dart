import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const logo = _Image('logo.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(logo, context);
  }
}
