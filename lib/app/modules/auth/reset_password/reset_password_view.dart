import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/validators.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: const AppAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.resetTitle.toUpperCase(), style: AppTextStyles.h1),
                AppSpacing.h8,
                Text(AppStrings.resetSub, style: AppTextStyles.caption.copyWith(fontSize: 15)),
                AppSpacing.h24,
                AppTextField(
                  label: AppStrings.newPassword,
                  hint: AppStrings.newPasswordHint,
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: controller.passwordController,
                  validator: Validators.strongPassword,
                  onChanged: controller.onPasswordChanged,
                  textInputAction: TextInputAction.next,
                ),
                AppSpacing.h16,
                AppTextField(
                  label: AppStrings.confirmPassword,
                  hint: AppStrings.confirmPasswordHint,
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: controller.confirmController,
                  validator: (v) => Validators.confirmPassword(v, controller.passwordController.text),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => controller.submit(),
                ),
                AppSpacing.h20,
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SegmentedProgressBar(
                        total: 4,
                        filled: controller.strength,
                        activeColor: controller.strength <= 1 ? AppColors.danger : AppColors.primary,
                      ),
                      AppSpacing.h12,
                      CheckRow(text: AppStrings.ruleLength, ok: controller.hasLength),
                      AppSpacing.h8,
                      CheckRow(text: AppStrings.ruleNumber, ok: controller.hasNumber),
                      AppSpacing.h8,
                      CheckRow(text: AppStrings.ruleSymbol, ok: controller.hasSymbol),
                    ],
                  ),
                ),
                AppSpacing.h24,
                Obx(
                  () => AppButton(
                    AppStrings.resetPassword,
                    loading: controller.isLoading.value,
                    onPressed: controller.submit,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
