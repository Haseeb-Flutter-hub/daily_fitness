import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/validators.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final password = ''.obs;
  final isLoading = false.obs;

  bool get hasLength => password.value.length >= 8;
  bool get hasNumber => Validators.hasNumber(password.value);
  bool get hasSymbol => Validators.hasSymbol(password.value);

  /// 0..4: teen rules + lamba password (12+) ka bonus
  int get strength {
    var s = 0;
    if (hasLength) s++;
    if (hasNumber) s++;
    if (hasSymbol) s++;
    if (s == 3 && password.value.length >= 12) s++;
    return s;
  }

  void onPasswordChanged(String value) => password.value = value;

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // TODO: backend reset-password API
    isLoading.value = false;
    AppSnackbar.show(AppStrings.passwordUpdated);
    Get.offAllNamed(Routes.login);
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }
}
