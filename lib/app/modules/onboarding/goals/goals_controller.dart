import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class GoalOption {
  final String label;
  final IconData icon;
  const GoalOption(this.label, this.icon);
}

class GoalsController extends GetxController {
  static const goals = [
    GoalOption(AppStrings.goalStrength, Icons.fitness_center_rounded),
    GoalOption(AppStrings.goalWeight, Icons.local_fire_department_rounded),
    GoalOption(AppStrings.goalActive, Icons.bolt_rounded),
    GoalOption(AppStrings.goalFlexibility, Icons.self_improvement_rounded),
  ];

  final selected = 0.obs;

  void select(int index) => selected.value = index;

  Future<void> next() async {
    await StorageService.saveGoal(selected.value);
    Get.toNamed(Routes.planSetup);
  }
}
