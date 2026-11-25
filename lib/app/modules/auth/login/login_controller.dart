import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/data/services/auth_service.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // TODO: backend login API
    isLoading.value = false;

    if (!AuthService.isValid(emailController.text, passwordController.text)) {
      AppSnackbar.show(AppStrings.wrongCredentials, isError: true);
      return;
    }
    await _signIn();
  }

  Future<void> socialSignIn() async {
    // TODO: real Google/Apple sign in. Abhi dev user se login.
    await _signIn();
  }

  Future<void> _signIn() async {
    await StorageService.saveName(AuthService.devName);
    await StorageService.setLoggedIn(true);
    // Agar onboarding nahi hui to pehle wo, warna seedha Home.
    Get.offAllNamed(StorageService.isOnboarded ? Routes.home : Routes.goals);
  }

  void forgotPassword() => Get.toNamed(Routes.forgotPassword);

  void goToSignUp() => Get.offNamed(Routes.signUp);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
