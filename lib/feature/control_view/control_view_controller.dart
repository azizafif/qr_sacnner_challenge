import 'dart:io';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_challenge/app/shared/controllers/base_controller.dart';

class ControlViewController extends BaseController {
  final Rx<int> selectedIndex = 0.obs;
  QRViewController? qrController;
  @override
  void onInit() {
    reassemble();

    super.onInit();
  }

  void reassemble() {
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }
}
