import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

class AppSocialButton extends StatelessWidget {
  final String label;
  final String letter; // brand icon ki jagah pehla harf
  final VoidCallback? onPressed;

  const AppSocialButton({super.key, required this.label, required this.letter, this.onPressed});

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(letter, style: AppTextStyles.display(20, color: AppColors.primary)),
            AppSpacing.w8,
            Text(label),
          ],
        ),
      );
}
