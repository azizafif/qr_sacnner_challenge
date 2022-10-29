import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_scanner_challenge/app/shared/handlers/connectivity_handler.dart';

import '../../design/index.dart';
import 'index.dart';

class SmartScaffold extends StatelessWidget {
  const SmartScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: ConnectivityHandler.isConnectedValueNotifier,
        builder: (_, final bool isConnected, ___) => isConnected
            ? GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: Scaffold(
                  key: key,
                  appBar: appBar,
                  body: Platform.isIOS ? SafeArea(child: body) : body,
                  floatingActionButton: floatingActionButton,
                  floatingActionButtonLocation: floatingActionButtonLocation ??
                      (Platform.isIOS
                          ? FloatingActionButtonLocation.centerDocked
                          : FloatingActionButtonLocation.centerFloat),
                  bottomNavigationBar: bottomNavigationBar,
                  bottomSheet: bottomSheet,
                  backgroundColor: backgroundColor,
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                ),
              )
            : const _DisconnectedWidget(),
      );
}

class _DisconnectedWidget extends StatelessWidget {
  const _DisconnectedWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Card(
            color: Colors.white,
            elevation: 40,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FittedBox(
                    child: Image.asset('assets/images/logo.png',
                        height: 250, width: 200)),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppValues.bodyMaxSymetricHorizontalPadding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'You are not connected\nto the Internet',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppColors.primaryColor,
                                    letterSpacing: 2,
                                    height: 1,
                                    shadows: [
                                  const BoxShadow(
                                      color: Colors.black, blurRadius: 2)
                                ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const VerticalSpacing(30),
                        Flexible(
                          child: Text(
                            'This app requires an internet connection to function.\nPlease reconnect to continue using our services.',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const VerticalSpacing(50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
