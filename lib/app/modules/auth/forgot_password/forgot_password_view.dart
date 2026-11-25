import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/validators.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: const AppAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.h16,
                const IconBadge(icon: Icons.lock_outline_rounded),
                AppSpacing.h24,
                Text(AppStrings.forgotTitle.toUpperCase(), style: AppTextStyles.h1),
                AppSpacing.h12,
                Text(
                  AppStrings.forgotSub,
                  style: AppTextStyles.body.copyWith(color: AppColors.textMuted, height: 1.5),
                ),
                AppSpacing.h24,
                AppTextField(
                  label: AppStrings.email,
                  hint: AppStrings.emailHint,
                  icon: Icons.mail_outline_rounded,
                  controller: controller.emailController,
                  validator: Validators.email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => controller.sendLink(),
                ),
                AppSpacing.h24,
                Obx(
                  () => AppButton(
                    AppStrings.sendResetLink,
                    loading: controller.isLoading.value,
                    onPressed: controller.sendLink,
                  ),
                ),
                AppSpacing.h8,
                AppTextLink(
                  AppStrings.backToLogin,
                  expanded: true,
                  color: AppColors.textPrimary,
                  onTap: controller.backToLogin,
                ),
              ],
            ),
          ),
        ),
      );
}
