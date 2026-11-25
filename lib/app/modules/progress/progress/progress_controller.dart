import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/data/models/workout_log.dart';
import 'package:daily_fitness/app/data/services/history_repository.dart';
import 'package:daily_fitness/app/data/services/progress_stats.dart';

class ProgressController extends GetxController {
  final logs = <WorkoutLog>[].obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  void reload() => logs.assignAll(HistoryRepository.all());

  ProgressStats get stats => ProgressStats(logs.toList(), DateTime.now());

  List<int> get weekMinutes => stats.weekMinutes;
  int get todayIndex => DateTime.now().weekday - 1;
  int get weekTotal => stats.weekTotalMinutes;

  // DEMO: pichle hafte ka total abhi fixed hai, wazan tracker bhi abhi nahi bana.
  int get lastWeekTotal => 90;
  int get vsLastWeekPercent =>
      lastWeekTotal == 0 ? 0 : (((weekTotal - lastWeekTotal) / lastWeekTotal) * 100).round();

  bool get badge7Day => stats.streak >= 7;
  bool get badge10Workouts => logs.length >= 10;
  bool get badgeEarlyBird => logs.any((l) => l.at.hour < 8);

  // TODO: ye screens banne par Get.toNamed(Routes.xxx) lagana.
  void openHistory() => _soon('History');
  void openLogWeight() => _soon('Log weight');
  void openAchievements() => _soon('Achievements');

  void _soon(String what) => AppSnackbar.show('$what ${AppStrings.comingSoon}');
}
