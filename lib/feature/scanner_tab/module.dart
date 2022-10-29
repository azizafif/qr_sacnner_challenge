import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_controller.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_tab.dart';

import '../../app/shared/modules/exports.dart';

final scannerTab = GetPage(
  name: '/scannerTab',
  page: () =>
      const InheritanceProviderOf<ScannerController>(across: ScannerTab()),
  binding: BindingsBuilder.put(() => ScannerController()),
);
