import 'package:qr_scanner_challenge/data/db_helper.dart';

class HistoryServices {
  Future<List<Map<String, dynamic>>> addScannedQrCode() async {
    return await DBHelper.query();
  }
}
