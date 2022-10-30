import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_challenge/app/design/index.dart';
import 'package:qr_scanner_challenge/app/shared/widgets/index.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';
import 'package:intl/intl.dart';

import 'package:qr_scanner_challenge/feature/history_tab/history_controller.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());

    return SmartScaffold(
        body: RefreshIndicator(
      color: Colors.white,
      backgroundColor: AppColors.primaryColor,
      onRefresh: () async => controller.getScannedQrCodes(),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 11.0, vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scanning History",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const VerticalSpacing(15),
                      Text(
                        "The app will keep all your scanned codes history \nstored locally in your phone",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.secondaryColor),
                      ),
                      const VerticalSpacing(20),
                      Obx(() => controller.scannedQrCodesList.isNotEmpty
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3.5, crossAxisCount: 1),
                              itemCount: controller.scannedQrCodesList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _ScannedQrCodeCard(
                                    scannedQrCode:
                                        controller.scannedQrCodesList[index]);
                              },
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  "No qr code scanned!",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class _ScannedQrCodeCard extends StatelessWidget {
  _ScannedQrCodeCard({required this.scannedQrCode});
  ScannedQrCodeModel scannedQrCode;
  late String scannedAt;

  @override
  Widget build(BuildContext context) {
    scannedAt = parseTimeStamp(scannedQrCode.scannedAt ?? 0);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        semanticContainer: true,
        child: ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Image(
              height: 25,
              image: AppImages.linkIcon,
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            scannedQrCode.qrContent ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Text(
            scannedAt,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }

  String parseTimeStamp(int value) {
    var date = DateTime.fromMillisecondsSinceEpoch(value);
    var d12 = DateFormat('MM-dd-yyyy, hh:mm a').format(date);
    return d12;
  }
}
