import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';

/// Bara gol lime button (Player ka pause/play).
class AppPlayButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;

  const AppPlayButton({super.key, required this.icon, this.onPressed, this.size = 76});

  @override
  Widget build(BuildContext context) => Material(
        color: AppColors.primary,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(icon, size: size * 0.42, color: AppColors.onPrimary),
          ),
        ),
      );
}
