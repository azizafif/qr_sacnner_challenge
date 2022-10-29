import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_challenge/app/shared/controllers/base_controller.dart';
import 'package:qr_scanner_challenge/app/shared/modules/inherited_controller.dart';

extension InheritedControllerFinder on BuildContext {
  T find<T extends BaseController>() =>
      dependOnInheritedWidgetOfExactType<InheritedController<T>>()
          ?.controller ??
      Get.find<T>();
}
