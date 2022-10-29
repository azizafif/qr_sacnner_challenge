import 'package:flutter/material.dart';
import 'package:qr_scanner_challenge/app/app_widget.dart';
import 'package:qr_scanner_challenge/data/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();

  runApp(MyApp());
}
