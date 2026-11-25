import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';

enum AppButtonType { primary, ghost, danger }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final IconData? icon;
  final bool loading;
  final double height;

  const AppButton(
    this.label, {
    super.key,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.loading = false,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    final ghost = type == AppButtonType.ghost;
    final Widget child = loading
        ? SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: ghost ? AppColors.textPrimary : AppColors.onPrimary,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon, size: 20), AppSpacing.w8],
              Text(label),
            ],
          );
    final onTap = loading ? null : onPressed;
    final size = Size.fromHeight(height);

    if (ghost) {
      return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(minimumSize: size),
        child: child,
      );
    }
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        minimumSize: size,
        backgroundColor: type == AppButtonType.danger ? AppColors.danger : AppColors.primary,
      ),
      child: child,
    );
  }
}
