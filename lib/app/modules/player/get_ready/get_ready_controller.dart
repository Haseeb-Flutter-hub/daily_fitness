import 'package:get/get.dart';

import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class GetReadyController extends GetxController {
  final session = Get.find<WorkoutSessionController>();
  Worker? _worker;

  @override
  void onInit() {
    super.onInit();
    // Countdown khatam (ya "Start now") hote hi Player khulta hai.
    _worker = ever(session.phase, (SessionPhase p) {
      if (p == SessionPhase.work) Get.offNamed(Routes.player);
    });
  }

  void startNow() => session.skipCountdown();
  void cancel() => Get.back();

  @override
  void onClose() {
    _worker?.dispose();
    if (session.phase.value == SessionPhase.ready) session.abort();
    super.onClose();
  }
}
