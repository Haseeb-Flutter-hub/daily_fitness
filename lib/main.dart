import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_theme.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const DailyFitnessApp());
}

class DailyFitnessApp extends StatelessWidget {
  const DailyFitnessApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        defaultTransition: Transition.fadeIn,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      );
}
