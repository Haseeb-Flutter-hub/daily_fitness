import 'dart:async';

import 'package:get/get.dart';

import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class VerifyEmailController extends GetxController {
  late final String email;
  final otpController = AppOtpController();
  final code = ''.obs;
  final isLoading = false.obs;
  final secondsLeft = 30.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    email = args is String ? args : 'name@example.com';
    _startTimer();
  }

  void _startTimer() {
    secondsLeft.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft.value <= 1) {
        secondsLeft.value = 0;
        t.cancel();
      } else {
        secondsLeft.value--;
      }
    });
  }

  void onCodeChanged(String value) => code.value = value;

  void resend() {
    if (secondsLeft.value > 0) return;
    otpController.clear(); // purana code saaf
    _startTimer();
    AppSnackbar.show('A new code was sent to $email');
  }

  Future<void> verify() async {
    if (isLoading.value) return;
    if (code.value.length < 6) {
      AppSnackbar.show(AppStrings.enterCode, isError: true);
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // TODO: backend verify API
    isLoading.value = false;
    Get.offAllNamed(Routes.goals);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
