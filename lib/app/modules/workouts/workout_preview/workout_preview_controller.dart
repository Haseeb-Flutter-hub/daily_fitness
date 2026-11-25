import 'package:get/get.dart';

import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class WorkoutPreviewController extends GetxController {
  final session = Get.find<WorkoutSessionController>();

  void start() {
    session.startCountdown();
    Get.toNamed(Routes.getReady);
  }
}
