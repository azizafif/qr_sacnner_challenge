import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'scannedQrcodes';

  static initDB() async {
    if (_db != null) {
      return _db!;
    }
    try {
      String path = join(await getDatabasesPath(), 'scannedQrcodes.db');
      _db = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            qrContent STRING,
            scannedAt INTEGER
           )
          
          ''');
      });
      debugPrint('creating a new database');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<int> insert(ScannedQrCodeModel? scannedQrCodeModel) async {
    debugPrint('insert function called');
    return await _db!.insert(_tableName, scannedQrCodeModel!.toJson());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    debugPrint('query function called');

    return await _db!.query(_tableName);
  }
}
