import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/widgets/buttons/app_icon_button.dart';

/// Standard top bar: gol back button + optional title + optional actions.
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final bool showBack;

  const AppAppBar({super.key, this.title, this.actions, this.onBack, this.showBack = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight + 8,
        leadingWidth: 62,
        leading: showBack
            ? Padding(
                padding: const EdgeInsets.only(left: AppSpacing.xl),
                child: Center(
                  child: AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    tooltip: 'Back',
                    onPressed: onBack ?? () => Get.back(),
                  ),
                ),
              )
            : null,
        title: title == null ? null : Text(title!),
        actions: [...?actions, const SizedBox(width: AppSpacing.xl)],
      );
}
