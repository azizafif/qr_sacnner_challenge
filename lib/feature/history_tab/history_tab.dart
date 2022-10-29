import 'package:flutter/material.dart';
import 'package:qr_scanner_challenge/app/shared/widgets/index.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SmartScaffold(
      body: Center(
        child: Text("History"),
      ),
    );
  }
}
