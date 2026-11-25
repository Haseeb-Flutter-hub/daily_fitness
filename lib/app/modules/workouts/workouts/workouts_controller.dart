import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/data/models/exercise.dart';
import 'package:daily_fitness/app/data/models/workout_log.dart';
import 'package:daily_fitness/app/data/sample_data.dart';
import 'package:daily_fitness/app/data/services/history_repository.dart';
import 'package:daily_fitness/app/data/services/progress_stats.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class WorkoutsController extends GetxController {
  static const categories = ['All', 'Upper body', 'Lower body', 'Core', 'Cardio'];

  final searchController = TextEditingController();
  final query = ''.obs;
  final categoryIndex = 0.obs;
  final logs = <WorkoutLog>[].obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  void reload() => logs.assignAll(HistoryRepository.all());

  void onQueryChanged(String value) => query.value = value;
  void selectCategory(int i) => categoryIndex.value = i;

  /// Category aur search dono lagne ke baad ki list.
  List<Exercise> get filtered {
    final q = query.value.trim().toLowerCase();
    final cat = categories[categoryIndex.value];
    return sampleExercises.where((e) {
      final matchesCategory = categoryIndex.value == 0 || e.category == cat;
      final matchesQuery =
          q.isEmpty || e.name.toLowerCase().contains(q) || e.muscles.toLowerCase().contains(q);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  /// Challenge ka din = ab tak kitne alag dinon mein workout hui (1..30).
  int get challengeDay {
    final days = ProgressStats(logs.toList(), DateTime.now()).activeDays.length;
    return math.min(30, math.max(1, days));
  }

  double get challengeProgress => challengeDay / 30;

  void openExercise(Exercise e) => Get.toNamed(Routes.exerciseDetail, arguments: e);

  // TODO: ye screens banne par Get.toNamed(Routes.xxx) lagana.
  void openChallenge() => _soon(AppStrings.challengeName);
  void openCreate() => _soon('Create workout');
  void openHistory() => _soon('History');

  void _soon(String what) => AppSnackbar.show('$what ${AppStrings.comingSoon}');

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
