import 'package:qr_scanner_challenge/feature/control_view/control_view.dart';
import 'package:qr_scanner_challenge/feature/control_view/control_view_controller.dart';

import '../../app/shared/modules/exports.dart';

final controlModule = GetPage(
  name: '/ControlViewModule',
  page: () =>
      InheritanceProviderOf<ControlViewController>(across: ControlView()),
  binding: BindingsBuilder.put(() => ControlViewController()),
);
