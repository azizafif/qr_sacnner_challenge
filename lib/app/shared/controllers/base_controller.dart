import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  performAndUpdate(VoidCallback function) => {function.call(), update()};
}
