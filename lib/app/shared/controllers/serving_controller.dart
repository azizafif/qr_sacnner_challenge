import 'base_controller.dart';

abstract class ServingController<S> extends BaseController {
  ServingController(this.service);

  S service;
}
