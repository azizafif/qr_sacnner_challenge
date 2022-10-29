import 'package:qr_scanner_challenge/data/db_helper.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';

import '../../app/shared/modules/exports.dart';

class ScannerServices {
  addScannedQrCode({ScannedQrCodeModel? scannedQrCode}) {
    debugPrint('addScannedQrCode called');
    return DBHelper.insert(scannedQrCode);
  }
}
