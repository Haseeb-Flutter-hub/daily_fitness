import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/validators.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: const AppAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.loginTitle.toUpperCase(), style: AppTextStyles.h1),
                AppSpacing.h8,
                Text(AppStrings.loginSub, style: AppTextStyles.caption.copyWith(fontSize: 15)),
                AppSpacing.h24,
                AppTextField(
                  label: AppStrings.email,
                  hint: AppStrings.emailHint,
                  icon: Icons.mail_outline_rounded,
                  controller: controller.emailController,
                  validator: Validators.email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                AppSpacing.h16,
                AppTextField(
                  label: AppStrings.password,
                  hint: AppStrings.loginPasswordHint,
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: controller.passwordController,
                  validator: (v) => (v == null || v.isEmpty) ? 'Password is required' : null,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => controller.login(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextLink(AppStrings.forgotPassword, onTap: controller.forgotPassword),
                ),
                AppSpacing.h8,
                Obx(
                  () => AppButton(
                    AppStrings.logIn,
                    loading: controller.isLoading.value,
                    onPressed: controller.login,
                  ),
                ),
                AppSpacing.h20,
                const OrDivider(text: AppStrings.or),
                AppSpacing.h20,
                SocialButtonsRow(onGoogle: controller.socialSignIn, onApple: controller.socialSignIn),
                AppSpacing.h24,
                FooterLink(
                  text: AppStrings.newHere,
                  linkLabel: AppStrings.createAccount,
                  onTap: controller.goToSignUp,
                ),
              ],
            ),
          ),
        ),
      );
}
