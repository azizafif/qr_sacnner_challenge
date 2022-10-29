import 'package:get/get.dart';
import 'package:qr_scanner_challenge/app/shared/controllers/serving_controller.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';
import 'package:qr_scanner_challenge/feature/history_tab/history_services.dart';

class HistoryController extends ServingController<HistoryServices> {
  HistoryController() : super(HistoryServices());
  HistoryController.serving(super.service);
  final RxList<ScannedQrCodeModel> scannedQrCodesList =
      <ScannedQrCodeModel>[].obs;

  @override
  void onInit() {
    getScannedQrCodes();
    super.onInit();
  }

  @override
  void onReady() {
    getScannedQrCodes();
    super.onReady();
  }

  void getScannedQrCodes() async {
    List<Map<String, dynamic>> scannedQrCodes =
        await service.addScannedQrCode();

    scannedQrCodesList.assignAll(scannedQrCodes.reversed
        .map((data) => ScannedQrCodeModel.fromJson(data))
        .toList());

    scannedQrCodesList.refresh();
  }
}
