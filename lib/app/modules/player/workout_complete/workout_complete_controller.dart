import 'package:get/get.dart';

import 'package:daily_fitness/app/data/services/history_repository.dart';
import 'package:daily_fitness/app/data/services/progress_stats.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/modules/main_shell/main_shell/main_shell_controller.dart';
import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';

class WorkoutCompleteController extends GetxController {
  final session = Get.find<WorkoutSessionController>();
  final feel = 1.obs; // 0 Easy, 1 Good, 2 Hard
  late final int streak;
  final String userName = StorageService.userName;

  @override
  void onInit() {
    super.onInit();
    streak = ProgressStats(HistoryRepository.all(), DateTime.now()).streak;
  }

  void done() => Get.back(); // Summary Home ke upar thi

  void viewProgress() {
    Get.back();
    Get.find<MainShellController>().changeTab(2);
  }
}
