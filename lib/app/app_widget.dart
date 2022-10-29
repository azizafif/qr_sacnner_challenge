import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'design/index.dart';
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
  Widget build(BuildContext context) => const GetMaterialApp(
        //$ Theme management
        // theme: AppThemes.lightTheme,
        // darkTheme: AppThemes.darkTheme,
        // themeMode: AppThemes.themeMode,

        //& Locales management
        // supportedLocales: S.delegate.supportedLocales,
        // locale: S.delegate.supportedLocales.first,
        // fallbackLocale: S.delegate.supportedLocales.last,
        // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],

        //@ Routing
        // initialRoute: signInModule.name,
        // getPages: [
        //   signInModule,
        //   signUpModule,
        //   profileModule,
        //   speciesModule,
        //   stylesModule,
        // ],
        defaultTransition: Transition.cupertino,
      );
}
