import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';

/// Gol background ke andar icon (Verify, Forgot password, Permission waghera).
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final Color color;
  final Color background;

  const IconBadge({
    super.key,
    required this.icon,
    this.size = 84,
    this.iconSize = 40,
    this.color = AppColors.primary,
    this.background = AppColors.primaryTint,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Icon(icon, size: iconSize, color: color),
      );
}
