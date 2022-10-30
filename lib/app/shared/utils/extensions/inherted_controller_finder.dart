import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_challenge/app/shared/controllers/base_controller.dart';
import 'package:qr_scanner_challenge/app/shared/modules/inherited_controller.dart';

//* This extension on BuildContext help to find the getx controller
//* with the help of the inherited widget
extension InheritedControllerFinder on BuildContext {
  T find<T extends BaseController>() =>
      dependOnInheritedWidgetOfExactType<InheritedController<T>>()
          ?.controller ??
      Get.find<T>();
}
