import 'package:get/get.dart';

import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class PlayerController extends GetxController {
  final session = Get.find<WorkoutSessionController>();
  Worker? _worker;

  @override
  void onInit() {
    super.onInit();
    // Workout khatam hote hi Summary khulti hai (Home ke upar).
    _worker = ever(session.phase, (SessionPhase p) {
      if (p == SessionPhase.done) {
        Get.offNamedUntil(Routes.workoutComplete, (r) => r.settings.name == Routes.home);
      }
    });
  }

  void openPause() {
    session.pause();
    Get.toNamed(Routes.paused);
  }

  @override
  void onClose() {
    _worker?.dispose();
    session.abortIfRunning(); // back dabane par timer band
    super.onClose();
  }
}
