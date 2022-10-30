import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:qr_scanner_challenge/app/design/app_constants.dart';
import 'package:qr_scanner_challenge/app/design/index.dart';
import 'package:qr_scanner_challenge/app/shared/modules/exports.dart';
import 'package:qr_scanner_challenge/app/shared/utils/extensions/inherted_controller_finder.dart';
import 'package:qr_scanner_challenge/feature/control_view/control_view_controller.dart';
import 'package:qr_scanner_challenge/feature/history_tab/history_tab.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_tab.dart';

import '../../app/shared/widgets/index.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SmartScaffold(
        body: context.find<ControlViewController>().selectedIndex.value == 0
            ? const ScannerTab()
            : const HistoryTab(),
        bottomNavigationBar: Obx(() {
          return BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex:
                context.find<ControlViewController>().selectedIndex.value,
            showElevation: true,
            onItemSelected: (index) {
              context.find<ControlViewController>().selectedIndex.value = index;
              context.find<ControlViewController>().reassemble();
            },
            containerHeight: 60,
            items: [
              BottomNavyBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(left: 9.0),
                  child: Image(
                    height: 23,
                    image: AppImages.scannerIcon,
                    color: AppColors.primaryColor,
                  ),
                ),
                title: const Center(
                  child: Text(AppConstants.scannnerTab),
                ),
                activeColor: AppColors.primaryColor,
              ),
              BottomNavyBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(left: 9.0),
                  child: Image(
                    height: 23,
                    image: AppImages.historyIcon,
                    color: AppColors.primaryColor,
                  ),
                ),
                title: const Center(
                  child: Text(AppConstants.historyTab),
                ),
                activeColor: AppColors.primaryColor,
              ),
            ],
          );
        }),
      );
    });
  }
}
