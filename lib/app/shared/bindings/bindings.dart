import 'package:get/get.dart';
import 'package:qr_scanner_challenge/feature/history_tab/history_controller.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerController());
    Get.lazyPut(() => HistoryController());
  }
}
