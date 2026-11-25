import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final isLoading = false.obs;

  Future<void> sendLink() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // TODO: backend forgot-password API
    isLoading.value = false;
    AppSnackbar.show('${AppStrings.resetLinkSent} ${emailController.text.trim()}');
    // Asli app mein email ka link Reset screen kholta hai. Abhi seedha khol rahe hain.
    Get.toNamed(Routes.resetPassword);
  }

  void backToLogin() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
