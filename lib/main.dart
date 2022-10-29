import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner_challenge/app/app_widget.dart';
import 'package:qr_scanner_challenge/data/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  _setupStatusBarTransparency();

  runApp(MyApp());
}

void _setupStatusBarTransparency() =>
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarBrightness: Brightness.light));
