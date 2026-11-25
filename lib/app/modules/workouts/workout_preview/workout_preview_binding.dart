import 'package:get/get.dart';

import 'workout_preview_controller.dart';

class WorkoutPreviewBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<WorkoutPreviewController>(() => WorkoutPreviewController());
}
