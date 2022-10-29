import 'package:qr_scanner_challenge/app/shared/controllers/base_controller.dart';

import 'exports.dart';

class InheritedController<T extends BaseController> extends InheritedWidget {
  InheritedController({super.key, required this.screen}) : super(child: screen);

  final Widget screen;
  final T controller = Get.find<T>();

  @override
  bool updateShouldNotify(InheritedController<T> oldWidget) =>
      controller != oldWidget.controller;
}
