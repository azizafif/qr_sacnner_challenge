import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_challenge/app/shared/controllers/serving_controller.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_services.dart';

import '../../app/shared/modules/exports.dart';

class ScannerController extends ServingController<ScannerServices> {
  ScannerController() : super(ScannerServices());
  ScannerController.serving(super.service);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;
  final RxList<ScannedQrCodeModel> scannedQrCodeModelList =
      <ScannedQrCodeModel>[].obs;
  late DateTime _scannedAt;
  StreamSubscription<Barcode>? streamSubscription;
  Rx<bool> gotResult = false.obs;

  @override
  void onInit() {
    _scannedAt = DateTime.now();
    super.onInit();
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    streamSubscription = controller.scannedDataStream.listen((scanData) {
      result = scanData;
      gotResult.value = true;
      streamSubscription?.pause();
      controller.pauseCamera();
    });
  }

  String displayResult() =>
      'Barcode Type: ${describeEnum(result!.format)} \n\nContent: ${result?.code ?? ''}';

  void addScannedQrCodeToDB() async {
    int value = await service.addScannedQrCode(
        scannedQrCode: ScannedQrCodeModel(
      qrContent: result?.code ?? '',
      scannedAt: _scannedAt.millisecondsSinceEpoch,
    ));

    showSnackBar();
    cancelAndResume();

    debugPrint(value.toString());
  }

  void cancelAndResume() {
    streamSubscription?.resume();

    qrController?.resumeCamera();
    result = null;
    gotResult.value = false;

    debugPrint(gotResult.value.toString());
    debugPrint(result.toString());
  }

  void showSnackBar() {
    Get.showSnackbar(const GetSnackBar(
      title: 'Congrats',
      message: "Qr code content saved succefully",
      backgroundColor: Colors.green,
      duration: Duration(milliseconds: 1000),
    ));
  }

  @override
  void onClose() {
    qrController?.dispose();
    debugPrint("qrController disposed");
    super.onClose();
  }
}
