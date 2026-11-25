import 'package:get/get.dart';

import 'workout_complete_controller.dart';

class WorkoutCompleteBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<WorkoutCompleteController>(() => WorkoutCompleteController());
}
