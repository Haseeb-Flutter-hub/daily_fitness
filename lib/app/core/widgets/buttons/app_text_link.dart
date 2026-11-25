import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';

/// Chhota text button: "Forgot password?", "See all", "I already have an account".
class AppTextLink extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color color;
  final bool expanded; // true: poori width, 54 height

  const AppTextLink(
    this.label, {
    super.key,
    this.onTap,
    this.color = AppColors.primary,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: color,
          minimumSize: expanded ? const Size.fromHeight(54) : null,
        ),
        child: Text(label),
      );
}
