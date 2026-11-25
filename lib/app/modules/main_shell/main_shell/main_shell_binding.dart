import 'package:get/get.dart';

import 'package:daily_fitness/app/modules/home/home/home_controller.dart';
import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'package:daily_fitness/app/modules/profile/profile/profile_controller.dart';
import 'package:daily_fitness/app/modules/progress/progress/progress_controller.dart';
import 'package:daily_fitness/app/modules/workouts/workouts/workouts_controller.dart';
import 'main_shell_controller.dart';

class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainShellController>(() => MainShellController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<WorkoutsController>(() => WorkoutsController());
    Get.lazyPut<ProgressController>(() => ProgressController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.put<WorkoutSessionController>(WorkoutSessionController(), permanent: true);
  }
}
