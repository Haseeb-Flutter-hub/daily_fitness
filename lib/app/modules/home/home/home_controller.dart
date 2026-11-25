import 'dart:math' as math;

import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/formatters.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/data/models/exercise.dart';
import 'package:daily_fitness/app/data/models/program.dart';
import 'package:daily_fitness/app/data/models/workout_log.dart';
import 'package:daily_fitness/app/data/sample_data.dart';
import 'package:daily_fitness/app/data/services/history_repository.dart';
import 'package:daily_fitness/app/data/services/progress_stats.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/modules/main_shell/main_shell/main_shell_controller.dart';
import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final userName = ''.obs;
  final logs = <WorkoutLog>[].obs;

  final List<Exercise> plan = todaysPlan;
  final List<Program> programs = sampleProgramsForYou;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await HistoryRepository.seedIfNeeded();
    reload();
  }

  /// Storage se dobara parh kar screen update karo.
  void reload() {
    userName.value = StorageService.userName;
    logs.assignAll(HistoryRepository.all());
  }

  // Reactive: Obx ke andar parhne par logs badalte hi screen update hoti hai.
  ProgressStats get stats => ProgressStats(logs.toList(), DateTime.now());

  String get greeting => Formatters.greeting(DateTime.now());
  DateTime get todayDate => stats.today;
  List<DateTime> get weekDays => stats.weekDays;
  Set<DateTime> get completedDays => stats.completedThisWeek;

  int get exercisesTotal => plan.length;
  int get exercisesDone => math.min(stats.exercisesToday, exercisesTotal);
  bool get planDone => exercisesDone >= exercisesTotal;
  double get workoutProgress => exercisesTotal == 0 ? 0 : exercisesDone / exercisesTotal;
  int get planMinutes => plan.fold<int>(0, (s, e) => s + e.minutes);
  String get workoutMeta => '$planMinutes min  ·  $exercisesTotal exercises  ·  No equipment';

  int get minutesDone => stats.minutesToday;
  int get minutesGoal => StorageService.sessionMinutes; // onboarding mein chuna hua
  int get kcalBurned => stats.kcalToday;
  int get kcalGoal => minutesGoal * 10;
  int get streak => stats.streak;

  void openProfile() => Get.find<MainShellController>().changeTab(3);

  /// Aaj ke bache hue exercises ka workout shuru karo (pehle Preview).
  void startWorkout() {
    if (planDone) {
      AppSnackbar.show(AppStrings.workoutCompleteToday);
      return;
    }
    Get.find<WorkoutSessionController>().prepare(
      plan.skip(exercisesDone).toList(),
      name: 'Full Body Burn',
    );
    Get.toNamed(Routes.workoutPreview);
  }

  // TODO: ye screens banne par Get.toNamed(Routes.xxx) lagana.
  void openCalendar() => _soon('Calendar');
  void openNotifications() => _soon('Notifications');
  void openProgram(Program p) => _soon(p.name);

  void _soon(String what) => AppSnackbar.show('$what ${AppStrings.comingSoon}');
}
