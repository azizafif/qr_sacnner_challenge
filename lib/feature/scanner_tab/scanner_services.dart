import 'package:qr_scanner_challenge/data/db_helper.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';

class ScannerServices {
  addScannedQrCode({ScannedQrCodeModel? scannedQrCode}) {
    return DBHelper.insert(scannedQrCode);
  }
}
