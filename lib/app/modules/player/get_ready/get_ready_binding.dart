import 'package:get/get.dart';

import 'get_ready_controller.dart';

class GetReadyBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<GetReadyController>(() => GetReadyController());
}
