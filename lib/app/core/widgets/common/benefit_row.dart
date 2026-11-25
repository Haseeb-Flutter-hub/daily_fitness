import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

class BenefitRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const BenefitRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(icon, size: 22, color: AppColors.primary),
          AppSpacing.w12,
          Expanded(child: Text(text, style: AppTextStyles.subtitle.copyWith(fontSize: 15))),
        ],
      );
}
