import 'package:get/get.dart';
import 'plan_setup_controller.dart';

class PlanSetupBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<PlanSetupController>(() => PlanSetupController());
}
