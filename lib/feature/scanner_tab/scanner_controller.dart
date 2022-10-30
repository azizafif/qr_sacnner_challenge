import 'dart:async';
import 'dart:io';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_challenge/app/design/index.dart';
import 'package:qr_scanner_challenge/app/shared/controllers/serving_controller.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/shared/modules/exports.dart';

class ScannerController extends ServingController<ScannerServices> {
  ScannerController() : super(ScannerServices());
  ScannerController.serving(super.service);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;
  final RxList<ScannedQrCodeModel> scannedQrCodeModelList =
      <ScannedQrCodeModel>[].obs;

  StreamSubscription<Barcode>? streamSubscription;
  Rx<bool> gotResult = false.obs;

  @override
  void onInit() {
    reassemble();
    super.onInit();
  }

  @override
  void onReady() {
    reassemble();
    super.onReady();
  }

  void reassemble() {
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    streamSubscription = controller.scannedDataStream.listen((scanData) {
      result = scanData;
      gotResult.value = true;

      controller.pauseCamera();

      _showDialog(result?.code ?? '');
    });
  }

  void _addScannedQrCodeToDB() async {
    final DateTime scannedAt = DateTime.now();
    await service.addScannedQrCode(
        scannedQrCode: ScannedQrCodeModel(
      qrContent: result?.code ?? '',
      scannedAt: scannedAt.millisecondsSinceEpoch,
    ));

    _cancelAndResume();
  }

  void _cancelAndResume() {
    streamSubscription?.resume();

    qrController?.resumeCamera();
    result = null;
    gotResult.value = false;
    Get.back(closeOverlays: true);
  }

  _showDialog(String result) {
    if (result.contains('http') || result.contains('https')) {
      return Get.defaultDialog(
        onWillPop: () async {
          Get.back(closeOverlays: true);
          return false;
        },
        title: 'Content',
        content: Text(result),
        onCancel: () => _cancelAndResume(),
        onConfirm: () => _launchURL(result),
        buttonColor: AppColors.primaryColor,
        confirmTextColor: Colors.white,
        cancelTextColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.all(21),
        textConfirm: "Open",
      );
    } else {
      return Get.defaultDialog(
        onWillPop: () async {
          Get.back(closeOverlays: true);
          return false;
        },
        title: 'Content',
        content: Text(result),
        onCancel: () => _cancelAndResume(),
        onConfirm: () => _addScannedQrCodeToDB(),
        buttonColor: AppColors.primaryColor,
        confirmTextColor: Colors.white,
        cancelTextColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.all(21),
        textConfirm: "Save",
      );
    }
  }

  //@ launch Url Function
  _launchURL(String urlQRCode) async {
    Uri url = Uri.parse(urlQRCode);
    if (await canLaunchUrl(url)) {
      _addScannedQrCodeToDB();
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onClose() {
    qrController?.dispose();
    streamSubscription?.cancel();
    super.onClose();
  }
}
