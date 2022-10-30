import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_challenge/app/design/index.dart';
import 'package:qr_scanner_challenge/app/shared/widgets/index.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_controller.dart';

class ScannerTab extends StatelessWidget {
  const ScannerTab({super.key});

  @override
  Widget build(BuildContext context) {
    ScannerController controller = Get.put(ScannerController());

    return SmartScaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Scan QR code",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(10),
          Text(
            "Place the qr code inside the frame to scan. \nPlease avoid shaking to get results quikly",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.secondaryColor),
          ),
          const VerticalSpacing(20),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.defaultRadius),
              child: SizedBox(
                height: 350,
                width: 350,
                child: QRView(
                  key: controller.qrKey,
                  onQRViewCreated: controller.onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    cutOutSize: 300,
                    borderLength: 2,
                    borderWidth: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
