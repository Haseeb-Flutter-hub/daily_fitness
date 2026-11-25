import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final agreed = true.obs;
  final isLoading = false.obs;

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) return;
    if (!agreed.value) {
      AppSnackbar.show(AppStrings.agreeRequired, isError: true);
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // TODO: backend sign up API
    isLoading.value = false;
    await StorageService.saveName(nameController.text.trim());
    Get.toNamed(Routes.verifyEmail, arguments: emailController.text.trim());
  }

  void socialSignIn() => Get.toNamed(Routes.goals); // TODO: real Google/Apple sign in

  void goToLogin() => Get.offNamed(Routes.login);

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
