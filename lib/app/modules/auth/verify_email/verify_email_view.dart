import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/formatters.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'verify_email_controller.dart';

class VerifyEmailView extends GetView<VerifyEmailController> {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: const AppAppBar(),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpacing.h24,
                    const IconBadge(icon: Icons.mail_outline_rounded),
                    AppSpacing.h24,
                    Text(
                      AppStrings.verifyTitle.toUpperCase(),
                      style: AppTextStyles.h1,
                      textAlign: TextAlign.center,
                    ),
                    AppSpacing.h12,
                    Text.rich(
                      TextSpan(
                        style: AppTextStyles.body.copyWith(color: AppColors.textMuted, height: 1.5),
                        children: [
                          TextSpan(text: '${AppStrings.verifySub} '),
                          TextSpan(
                            text: controller.email,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppSpacing.h24,
                    AppOtpField(
                      controller: controller.otpController,
                      onChanged: controller.onCodeChanged,
                      onCompleted: (_) => controller.verify(),
                    ),
                    AppSpacing.h24,
                    Obx(
                      () => controller.secondsLeft.value > 0
                          ? Text(
                              '${AppStrings.didNotGet} ${AppStrings.resendIn} ${Formatters.mmss(controller.secondsLeft.value)}',
                              style: AppTextStyles.caption,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.didNotGet, style: AppTextStyles.caption),
                                AppTextLink(AppStrings.resend, onTap: controller.resend),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => AppButton(
                AppStrings.verifyEmail,
                loading: controller.isLoading.value,
                onPressed: controller.verify,
              ),
            ),
          ],
        ),
      );
}
