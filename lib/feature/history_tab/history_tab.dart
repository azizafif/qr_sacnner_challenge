import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_challenge/app/design/app_constants.dart';
import 'package:qr_scanner_challenge/app/design/index.dart';
import 'package:qr_scanner_challenge/app/shared/utils/extensions/inherted_controller_finder.dart';
import 'package:qr_scanner_challenge/app/shared/widgets/index.dart';
import 'package:qr_scanner_challenge/data/scanned_qr_model.dart';

import 'package:qr_scanner_challenge/feature/history_tab/history_controller.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    context.find<HistoryController>().getScannedQrCodes();
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: AppColors.primaryColor,
      onRefresh: () async =>
          context.find<HistoryController>().getScannedQrCodes(),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const VerticalSpacing(30),
                    Text(
                      AppConstants.historyTabTitle,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const VerticalSpacing(15),
                    Text(
                      AppConstants.historyTabDescription,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    const VerticalSpacing(20),
                    Obx(() => context
                            .find<HistoryController>()
                            .scannedQrCodesList
                            .isNotEmpty
                        ? GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 3.5, crossAxisCount: 1),
                            itemCount: context
                                .find<HistoryController>()
                                .scannedQrCodesList
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return _ScannedQrCodeCard(
                                  scannedQrCode: context
                                      .find<HistoryController>()
                                      .scannedQrCodesList[index]);
                            },
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                AppConstants.historyTabNoData,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannedQrCodeCard extends StatelessWidget {
  _ScannedQrCodeCard({required this.scannedQrCode});
  ScannedQrCodeModel scannedQrCode;
  late String scannedAt;

  @override
  Widget build(BuildContext context) {
    //* Using extension on context to find the controller
    scannedAt = context
        .find<HistoryController>()
        .parseTimeStamp(scannedQrCode.scannedAt ?? 0);
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
          title: SelectableText(
            scannedQrCode.qrContent.toString(),
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
}
