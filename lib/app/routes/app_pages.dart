import 'package:get/get.dart';

import 'package:daily_fitness/app/modules/auth/forgot_password/forgot_password_binding.dart';
import 'package:daily_fitness/app/modules/auth/forgot_password/forgot_password_view.dart';
import 'package:daily_fitness/app/modules/auth/login/login_binding.dart';
import 'package:daily_fitness/app/modules/auth/login/login_view.dart';
import 'package:daily_fitness/app/modules/auth/reset_password/reset_password_binding.dart';
import 'package:daily_fitness/app/modules/auth/reset_password/reset_password_view.dart';
import 'package:daily_fitness/app/modules/auth/sign_up/sign_up_binding.dart';
import 'package:daily_fitness/app/modules/auth/sign_up/sign_up_view.dart';
import 'package:daily_fitness/app/modules/auth/verify_email/verify_email_binding.dart';
import 'package:daily_fitness/app/modules/auth/verify_email/verify_email_view.dart';
import 'package:daily_fitness/app/modules/auth/welcome/welcome_binding.dart';
import 'package:daily_fitness/app/modules/auth/welcome/welcome_view.dart';
import 'package:daily_fitness/app/modules/main_shell/main_shell/main_shell_binding.dart';
import 'package:daily_fitness/app/modules/main_shell/main_shell/main_shell_view.dart';
import 'package:daily_fitness/app/modules/onboarding/goals/goals_binding.dart';
import 'package:daily_fitness/app/modules/onboarding/goals/goals_view.dart';
import 'package:daily_fitness/app/modules/onboarding/permission/permission_binding.dart';
import 'package:daily_fitness/app/modules/onboarding/permission/permission_view.dart';
import 'package:daily_fitness/app/modules/onboarding/plan_setup/plan_setup_binding.dart';
import 'package:daily_fitness/app/modules/onboarding/plan_setup/plan_setup_view.dart';
import 'package:daily_fitness/app/modules/player/get_ready/get_ready_binding.dart';
import 'package:daily_fitness/app/modules/player/get_ready/get_ready_view.dart';
import 'package:daily_fitness/app/modules/player/paused/paused_binding.dart';
import 'package:daily_fitness/app/modules/player/paused/paused_view.dart';
import 'package:daily_fitness/app/modules/player/player/player_binding.dart';
import 'package:daily_fitness/app/modules/player/player/player_view.dart';
import 'package:daily_fitness/app/modules/player/workout_complete/workout_complete_binding.dart';
import 'package:daily_fitness/app/modules/player/workout_complete/workout_complete_view.dart';
import 'package:daily_fitness/app/modules/splash/splash/splash_binding.dart';
import 'package:daily_fitness/app/modules/splash/splash/splash_view.dart';
import 'package:daily_fitness/app/modules/workouts/exercise_detail/exercise_detail_binding.dart';
import 'package:daily_fitness/app/modules/workouts/exercise_detail/exercise_detail_view.dart';
import 'package:daily_fitness/app/modules/workouts/workout_preview/workout_preview_binding.dart';
import 'package:daily_fitness/app/modules/workouts/workout_preview/workout_preview_view.dart';
import 'app_routes.dart';

abstract final class AppPages {
  static const initial = Routes.splash;

  static final routes = <GetPage>[
    GetPage(name: Routes.splash, page: () => const SplashView(), binding: SplashBinding()),
    GetPage(name: Routes.welcome, page: () => const WelcomeView(), binding: WelcomeBinding()),
    GetPage(name: Routes.signUp, page: () => const SignUpView(), binding: SignUpBinding()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailView(), binding: VerifyEmailBinding()),
    GetPage(name: Routes.login, page: () => const LoginView(), binding: LoginBinding()),
    GetPage(name: Routes.forgotPassword, page: () => const ForgotPasswordView(), binding: ForgotPasswordBinding()),
    GetPage(name: Routes.resetPassword, page: () => const ResetPasswordView(), binding: ResetPasswordBinding()),
    GetPage(name: Routes.goals, page: () => const GoalsView(), binding: GoalsBinding()),
    GetPage(name: Routes.planSetup, page: () => const PlanSetupView(), binding: PlanSetupBinding()),
    GetPage(name: Routes.permission, page: () => const PermissionView(), binding: PermissionBinding()),
    GetPage(name: Routes.home, page: () => const MainShellView(), binding: MainShellBinding()),
    GetPage(name: Routes.exerciseDetail, page: () => const ExerciseDetailView(), binding: ExerciseDetailBinding()),
    GetPage(name: Routes.workoutPreview, page: () => const WorkoutPreviewView(), binding: WorkoutPreviewBinding()),
    GetPage(name: Routes.getReady, page: () => const GetReadyView(), binding: GetReadyBinding()),
    GetPage(name: Routes.player, page: () => const PlayerView(), binding: PlayerBinding()),
    GetPage(name: Routes.paused, page: () => const PausedView(), binding: PausedBinding()),
    GetPage(name: Routes.workoutComplete, page: () => const WorkoutCompleteView(), binding: WorkoutCompleteBinding()),
  ];
}
