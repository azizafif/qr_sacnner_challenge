import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_challenge/app/design/app_constants.dart';
import 'package:qr_scanner_challenge/app/design/index.dart';
import 'package:qr_scanner_challenge/app/shared/utils/extensions/inherted_controller_finder.dart';
import 'package:qr_scanner_challenge/app/shared/widgets/index.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_controller.dart';

class ScannerTab extends StatelessWidget {
  const ScannerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacing(20),
        Text(
          AppConstants.scannerTabTitle,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const VerticalSpacing(10),
        Text(
          AppConstants.scannerTabDescription,
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
              height: AppValues.frameHeight,
              width: AppValues.frameWidth,
              child: QRView(
                key: context.find<ScannerController>().qrKey,
                onQRViewCreated:
                    context.find<ScannerController>().onQRViewCreated,
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
    );
  }
}
