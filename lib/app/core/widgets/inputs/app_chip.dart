import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

class AppChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const AppChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: selected ? AppColors.primary : (backgroundColor ?? Colors.transparent),
        shape: StadiumBorder(
          side: BorderSide(color: selected ? AppColors.primary : AppColors.outline),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              label,
              style: AppTextStyles.label.copyWith(
                color: selected ? AppColors.onPrimary : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      );
}
