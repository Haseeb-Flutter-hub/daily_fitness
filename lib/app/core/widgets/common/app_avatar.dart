import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Gol avatar: naam ka pehla harf (naam na ho to person icon).
class AppAvatar extends StatelessWidget {
  final String? name;
  final double size;
  final VoidCallback? onTap;

  const AppAvatar({super.key, this.name, this.size = 42, this.onTap});

  @override
  Widget build(BuildContext context) {
    final n = name?.trim();
    final initial = (n == null || n.isEmpty) ? null : n[0].toUpperCase();
    return Material(
      color: AppColors.primary,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: initial != null
                ? Text(initial, style: AppTextStyles.display(size * 0.5, color: AppColors.onPrimary))
                : Icon(Icons.person_rounded, size: size * 0.5, color: AppColors.onPrimary),
          ),
        ),
      ),
    );
  }
}
