import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget label;

  const AppCheckbox({super.key, required this.value, required this.onChanged, required this.label});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onChanged(!value),
        borderRadius: AppRadius.smAll,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: value ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: value ? AppColors.primary : AppColors.outline, width: 1.5),
              ),
              child: value
                  ? const Icon(Icons.check_rounded, size: 16, color: AppColors.onPrimary)
                  : null,
            ),
            AppSpacing.w12,
            Expanded(child: label),
          ],
        ),
      );
}
