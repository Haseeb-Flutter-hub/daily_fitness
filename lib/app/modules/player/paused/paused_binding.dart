import 'package:get/get.dart';

import 'paused_controller.dart';

class PausedBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<PausedController>(() => PausedController());
}
