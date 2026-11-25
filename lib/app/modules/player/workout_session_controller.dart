import 'dart:async';

import 'package:get/get.dart';

import 'package:daily_fitness/app/data/models/exercise.dart';
import 'package:daily_fitness/app/data/models/workout_log.dart';
import 'package:daily_fitness/app/data/services/history_repository.dart';
import 'package:daily_fitness/app/modules/home/home/home_controller.dart';
import 'package:daily_fitness/app/modules/workouts/workouts/workouts_controller.dart';

enum SessionPhase { idle, ready, work, rest, done }

/// Poora workout: timer, set, exercise, rest. Permanent hai (MainShellBinding mein).
class WorkoutSessionController extends GetxController {
  static const readySeconds = 3;
  static const baseRestSeconds = 15;

  final title = 'Workout'.obs;
  final exercises = <Exercise>[].obs;
  final exerciseIndex = 0.obs;
  final setNumber = 1.obs;
  final remaining = 0.obs;
  final restTotal = baseRestSeconds.obs;
  final phase = SessionPhase.idle.obs;
  final paused = false.obs;
  final elapsed = 0.obs;
  final completedCount = 0.obs;
  final kcalBurned = 0.obs;

  Timer? _timer;
  bool _restLeadsToNext = false;

  Exercise get current => exercises[exerciseIndex.value];
  bool get isTimed => current.seconds != null;
  bool get isLast => exerciseIndex.value >= exercises.length - 1;
  Exercise? get next => isLast ? null : exercises[exerciseIndex.value + 1];
  bool get restLeadsToNext => _restLeadsToNext;
  int get totalMinutes => exercises.fold<int>(0, (s, e) => s + e.minutes);

  void prepare(List<Exercise> list, {String? name}) {
    _stopTimer();
    exercises.assignAll(list);
    title.value = name ?? (list.length == 1 ? list.first.name : 'Full Body Burn');
    exerciseIndex.value = 0;
    setNumber.value = 1;
    remaining.value = 0;
    elapsed.value = 0;
    completedCount.value = 0;
    kcalBurned.value = 0;
    paused.value = false;
    phase.value = SessionPhase.idle;
  }

  void startCountdown() {
    paused.value = false;
    phase.value = SessionPhase.ready;
    remaining.value = readySeconds;
    _startTimer();
  }

  void skipCountdown() {
    if (phase.value == SessionPhase.ready) _beginWork();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _tick() {
    if (paused.value) return;
    switch (phase.value) {
      case SessionPhase.ready:
        remaining.value--;
        if (remaining.value <= 0) _beginWork();
      case SessionPhase.work:
        elapsed.value++;
        if (isTimed) {
          remaining.value--;
          if (remaining.value <= 0) completeSet();
        }
      case SessionPhase.rest:
        elapsed.value++;
        remaining.value--;
        if (remaining.value <= 0) skipRest();
      case SessionPhase.idle:
      case SessionPhase.done:
        break;
    }
  }

  void _beginWork() {
    phase.value = SessionPhase.work;
    remaining.value = current.seconds ?? 0;
  }

  void completeSet() {
    if (phase.value != SessionPhase.work) return;
    if (setNumber.value < current.sets) {
      _startRest(leadsToNext: false);
      return;
    }
    _logCurrent();
    if (isLast) {
      finish();
    } else {
      _startRest(leadsToNext: true);
    }
  }

  void _startRest({required bool leadsToNext}) {
    _restLeadsToNext = leadsToNext;
    restTotal.value = baseRestSeconds;
    remaining.value = baseRestSeconds;
    phase.value = SessionPhase.rest;
  }

  void skipRest() {
    if (phase.value != SessionPhase.rest) return;
    if (_restLeadsToNext) {
      exerciseIndex.value++;
      setNumber.value = 1;
    } else {
      setNumber.value++;
    }
    _beginWork();
  }

  void addRest(int seconds) {
    if (phase.value != SessionPhase.rest) return;
    remaining.value += seconds;
    restTotal.value += seconds;
  }

  void previous() {
    if (exerciseIndex.value == 0) return;
    if (phase.value != SessionPhase.work && phase.value != SessionPhase.rest) return;
    exerciseIndex.value--;
    setNumber.value = 1;
    _beginWork();
  }

  void skipExercise() {
    if (isLast) {
      finish();
      return;
    }
    exerciseIndex.value++;
    setNumber.value = 1;
    _beginWork();
  }

  void restartExercise() {
    setNumber.value = 1;
    _beginWork();
  }

  void pause() => paused.value = true;

  void resume() {
    final p = phase.value;
    if (p == SessionPhase.ready || p == SessionPhase.work || p == SessionPhase.rest) {
      paused.value = false;
    }
  }

  void _logCurrent() {
    final e = current;
    unawaited(HistoryRepository.add(
      WorkoutLog(exercise: e.name, at: DateTime.now(), minutes: e.minutes, kcal: e.kcal),
    ));
    completedCount.value++;
    kcalBurned.value += e.kcal;
  }

  void finish() {
    _stopTimer();
    paused.value = false;
    phase.value = SessionPhase.done;
    _refreshScreens();
  }

  void abort() {
    _stopTimer();
    paused.value = false;
    phase.value = SessionPhase.idle;
    _refreshScreens();
  }

  void abortIfRunning() {
    if (phase.value != SessionPhase.done && phase.value != SessionPhase.idle) abort();
  }

  void _refreshScreens() {
    if (Get.isRegistered<HomeController>()) Get.find<HomeController>().reload();
    if (Get.isRegistered<WorkoutsController>()) Get.find<WorkoutsController>().reload();
  }

  @override
  void onClose() {
    _stopTimer();
    super.onClose();
  }
}
