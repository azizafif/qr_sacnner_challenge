import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_challenge/feature/control_view/control_view_module.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'design/index.dart';
import 'shared/bindings/bindings.dart';
import 'shared/handlers/connectivity_handler.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key}) {
    ConnectivityHandler.startMonitoring();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //$ loading assets without interrupted the eventLoop
    scheduleMicrotask(() async {
      await AppImages.precacheAssets(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 400,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(400, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
        //$ Theme management
        theme: AppThemes.lightTheme,

        //@ Binginds
        initialBinding: Binding(),

        //@ Routing
        initialRoute: controlModule.name,
        getPages: [
          controlModule,
        ],
        defaultTransition: Transition.cupertino,
      );
}
