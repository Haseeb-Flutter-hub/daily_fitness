import 'package:get/get.dart';

import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class PausedController extends GetxController {
  final session = Get.find<WorkoutSessionController>();

  void resume() {
    session.resume();
    Get.back();
  }

  void restart() {
    session.restartExercise();
    resume();
  }

  void endWorkout() {
    if (session.completedCount.value == 0) {
      // Kuch mukammal nahi hua: summary ke bajaye seedha Home.
      session.abort();
      Get.until((r) => r.settings.name == Routes.home);
    } else {
      session.finish(); // PlayerController summary khol dega
    }
  }

  @override
  void onClose() {
    session.resume(); // system back se bhi timer dobara chale
    super.onClose();
  }
}
