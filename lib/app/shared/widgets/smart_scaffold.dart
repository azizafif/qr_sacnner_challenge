import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_scanner_challenge/app/design/app_constants.dart';
import 'package:qr_scanner_challenge/app/shared/handlers/connectivity_handler.dart';

import '../../design/index.dart';
import 'index.dart';

class SmartScaffold extends StatelessWidget {
  const SmartScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
  });

  final Widget body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: ConnectivityHandler.isConnectedValueNotifier,
        builder: (_, final bool isConnected, ___) => isConnected
            ? GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: Scaffold(
                  key: key,
                  body: SafeArea(
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(top: AppValues.bodyTopPadding),
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(AppValues.defaultRadius),
                              topRight:
                                  Radius.circular(AppValues.defaultRadius))),
                      child: SizedBox.expand(child: body),
                    ),
                  ),
                  bottomNavigationBar: bottomNavigationBar,
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
              children: <Widget>[
                const FittedBox(
                    child:
                        Image(image: AppImages.logo, height: 250, width: 200)),
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
                            AppConstants.connectivityNoInternet,
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
                            AppConstants.connectivityMessage,
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
