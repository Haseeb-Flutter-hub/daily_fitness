import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/data/services/history_repository.dart';
import 'package:daily_fitness/app/data/services/progress_stats.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class ProfileController extends GetxController {
  static const _goalLabels = [
    AppStrings.goalStrength,
    AppStrings.goalWeight,
    AppStrings.goalActive,
    AppStrings.goalFlexibility,
  ];

  String get userName => StorageService.userName;
  String get goalLabel => _goalLabels[StorageService.goalIndex];
  int get dailyGoalMinutes => StorageService.sessionMinutes;

  int get totalWorkouts => HistoryRepository.all().length;
  int get totalHours => (HistoryRepository.all().fold<int>(0, (s, l) => s + l.minutes) / 60).round();
  int get bestStreak => ProgressStats(HistoryRepository.all(), DateTime.now()).streak;

  // TODO: ye screens banne par Get.toNamed(Routes.xxx) lagana.
  void openEditProfile() => _soon(AppStrings.editProfile);
  void openHistory() => _soon(AppStrings.history);
  void openAchievements() => _soon(AppStrings.achievementsTitle);
  void openSettings() => _soon(AppStrings.settings);

  void _soon(String what) => AppSnackbar.show('$what ${AppStrings.comingSoon}');

  Future<void> resetDemoData() async {
    await HistoryRepository.reseed();
    AppSnackbar.show(AppStrings.demoReset);
    Get.offAllNamed(Routes.home); // taaza data ke saath saari tabs dobara banengi
  }

  Future<void> logOut() async {
    await StorageService.setLoggedIn(false);
    Get.offAllNamed(Routes.welcome);
  }
}
