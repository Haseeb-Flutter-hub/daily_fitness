import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/validators.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: const AppAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.signUpTitle.toUpperCase(), style: AppTextStyles.h1),
                AppSpacing.h8,
                Text(AppStrings.signUpSub, style: AppTextStyles.caption.copyWith(fontSize: 15)),
                AppSpacing.h24,
                AppTextField(
                  label: AppStrings.fullName,
                  hint: AppStrings.fullNameHint,
                  icon: Icons.person_outline_rounded,
                  controller: controller.nameController,
                  validator: Validators.name,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                ),
                AppSpacing.h16,
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
                  hint: AppStrings.passwordHint,
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: controller.passwordController,
                  validator: Validators.password,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => controller.submit(),
                ),
                AppSpacing.h16,
                Obx(
                  () => AppCheckbox(
                    value: controller.agreed.value,
                    onChanged: (v) => controller.agreed.value = v,
                    label: Text(AppStrings.agreeTerms, style: AppTextStyles.caption),
                  ),
                ),
                AppSpacing.h24,
                Obx(
                  () => AppButton(
                    AppStrings.createAccount,
                    loading: controller.isLoading.value,
                    onPressed: controller.submit,
                  ),
                ),
                AppSpacing.h20,
                const OrDivider(text: AppStrings.or),
                AppSpacing.h20,
                SocialButtonsRow(onGoogle: controller.socialSignIn, onApple: controller.socialSignIn),
                AppSpacing.h24,
                FooterLink(
                  text: AppStrings.haveAccountQ,
                  linkLabel: AppStrings.logIn,
                  onTap: controller.goToLogin,
                ),
              ],
            ),
          ),
        ),
      );
}
