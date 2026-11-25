import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

abstract final class AppSnackbar {
  static void show(String message, {bool isError = false}) {
    Get.closeAllSnackbars();
    Get.rawSnackbar(
      messageText: Text(message, style: AppTextStyles.body),
      backgroundColor: isError ? AppColors.dangerTint : AppColors.elevated,
      borderColor: isError ? AppColors.danger : AppColors.border,
      borderWidth: 1,
      borderRadius: AppRadius.md,
      margin: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(
        isError ? Icons.error_outline_rounded : Icons.check_circle_outline_rounded,
        color: isError ? AppColors.danger : AppColors.primary,
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
