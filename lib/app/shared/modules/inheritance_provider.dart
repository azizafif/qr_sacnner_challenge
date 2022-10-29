import 'package:qr_scanner_challenge/app/shared/controllers/base_controller.dart';

import 'exports.dart';
import 'inherited_controller.dart';

class InheritanceProviderOf<T extends BaseController> extends StatelessWidget {
  const InheritanceProviderOf({super.key, required StatelessWidget across})
      : screen = across;

  final StatelessWidget screen;

  @override
  Widget build(BuildContext context) => InheritedController<T>(screen: screen);
}
