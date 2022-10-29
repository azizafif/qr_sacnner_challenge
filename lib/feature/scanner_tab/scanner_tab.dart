import 'package:flutter/material.dart';
import 'package:qr_scanner_challenge/app/shared/widgets/index.dart';

class ScannerTab extends StatelessWidget {
  const ScannerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SmartScaffold(
      body: Center(
        child: Text("Scanner"),
      ),
    );
  }
}
