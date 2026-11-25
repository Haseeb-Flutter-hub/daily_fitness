import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/data/models/exercise.dart';
import 'package:daily_fitness/app/data/sample_data.dart';
import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class ExerciseDetailController extends GetxController {
  late final Exercise exercise;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    exercise = args is Exercise ? args : sampleExercises.first;
  }

  List<String> get muscles => exercise.muscles.split(', ');

  // TODO: Demo video ya Custom workout banne par ye lagana.
  void watchDemo() => _soon('Demo video');
  void addToWorkout() => _soon('Custom workouts');

  /// Sirf isi ek exercise ka workout: seedha Get ready.
  void start() {
    final session = Get.find<WorkoutSessionController>();
    session.prepare([exercise]);
    session.startCountdown();
    Get.toNamed(Routes.getReady);
  }

  void _soon(String what) => AppSnackbar.show('$what ${AppStrings.comingSoon}');
}
