import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_challenge/app/design/index.dart';
import 'package:qr_scanner_challenge/feature/history_tab/history_tab.dart';
import 'package:qr_scanner_challenge/feature/scanner_tab/scanner_tab.dart';

import '../app/shared/widgets/index.dart';

class ControlView extends StatefulWidget {
  const ControlView({super.key});

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: const <Widget>[
            ScannerTab(),
            HistoryTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Image(
              height: 23,
              image: AppImages.scannerIcon,
              color: AppColors.primaryColor,
            ),
            title: const Text(
              'Home',
            ),
            activeColor: AppColors.primaryColor,
          ),
          BottomNavyBarItem(
            icon: const Image(
              height: 23,
              image: AppImages.historyIcon,
              color: AppColors.primaryColor,
            ),
            title: const Text(
              'History',
            ),
            activeColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
