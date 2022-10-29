import 'package:qr_scanner_challenge/data/db_helper.dart';

import '../../app/shared/modules/exports.dart';

class HistoryServices {
  Future<List<Map<String, dynamic>>> addScannedQrCode() async {
    debugPrint('addScannedQrCode called');
    return await DBHelper.query();
  }
}
