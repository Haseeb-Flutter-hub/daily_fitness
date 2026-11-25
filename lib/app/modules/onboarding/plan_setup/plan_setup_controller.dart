import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/formatters.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class PlanSetupController extends GetxController {
  static const levels = [
    AppStrings.levelBeginner,
    AppStrings.levelIntermediate,
    AppStrings.levelAdvanced,
  ];
  static const days = [2, 3, 4, 5, 6, 7];
  static const sessionMinutes = [10, 20, 30, 45];

  final levelIndex = 0.obs;
  final daysIndex = 2.obs; // 4 din
  final sessionIndex = 1.obs; // 20 min
  final reminderOn = true.obs;
  final reminderTime = const TimeOfDay(hour: 18, minute: 0).obs;

  List<String> get dayLabels => days.map((d) => '$d').toList();
  List<String> get sessionLabels => sessionMinutes.map((m) => '$m min').toList();
  String get reminderLabel => Formatters.timeOfDay(reminderTime.value);

  Future<void> pickTime() async {
    final picked = await showTimePicker(context: Get.context!, initialTime: reminderTime.value);
    if (picked != null) reminderTime.value = picked;
  }

  Future<void> finish() async {
    await StorageService.savePlan(
      level: levelIndex.value,
      daysPerWeek: days[daysIndex.value],
      sessionMinutes: sessionMinutes[sessionIndex.value],
      reminderOn: reminderOn.value,
      reminderHour: reminderTime.value.hour,
      reminderMinute: reminderTime.value.minute,
    );
    Get.toNamed(Routes.permission);
  }
}
