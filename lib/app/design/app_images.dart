import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const logo = _Image('logo.png');
  static const scannerIcon = _Image('qr-code.png');
  static const historyIcon = _Image('history.png');
  static const linkIcon = _Image('link.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(logo, context);
    await precacheImage(scannerIcon, context);
    await precacheImage(historyIcon, context);
    await precacheImage(linkIcon, context);
  }
}
