import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Rule ya benefit ki line: tick (poora) ya minus (baqi).
class CheckRow extends StatelessWidget {
  final String text;
  final bool ok;
  final Color okColor;

  const CheckRow({super.key, required this.text, required this.ok, this.okColor = AppColors.primary});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(
            ok ? Icons.check_rounded : Icons.remove_rounded,
            size: 18,
            color: ok ? okColor : AppColors.textMuted,
          ),
          AppSpacing.w8,
          Text(
            text,
            style: AppTextStyles.body.copyWith(
              fontSize: 14,
              color: ok ? AppColors.textPrimary : AppColors.textMuted,
            ),
          ),
        ],
      );
}
