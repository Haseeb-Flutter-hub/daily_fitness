/// Saare texts yahan. Screen mein seedha string mat likhna.
abstract final class AppStrings {
  static const appName = 'Daily Fitness';
  static const tagline = 'Train anywhere. No gym needed.';
  static const version = 'Version 1.0';

  // Splash
  static const loadingPlan = 'Loading your plan';

  // Welcome
  static const welcomeLine1 = 'Train anywhere.';
  static const welcomeLine2 = 'No gym needed.';
  static const welcomeBody =
      'Short, effective workouts you can do at home. No equipment, no excuses.';
  static const getStarted = 'Get started';
  static const haveAccount = 'I already have an account';
  static const chip20Min = '20 min';
  static const chipNoEquipment = 'No equipment';
  static const chipZeroGym = 'Zero gym';

  // Auth: Sign up
  static const signUpTitle = 'Create account';
  static const signUpSub = 'Start your fitness journey today.';
  static const fullName = 'Full name';
  static const fullNameHint = 'Your name';
  static const email = 'Email';
  static const emailHint = 'you@example.com';
  static const password = 'Password';
  static const passwordHint = 'At least 8 characters';
  static const agreeTerms = 'I agree to the Terms and Privacy Policy';
  static const agreeRequired = 'Please accept the Terms to continue';
  static const createAccount = 'Create account';
  static const or = 'or';
  static const haveAccountQ = 'Already have an account?';
  static const logIn = 'Log in';

  // Auth: Login
  static const loginTitle = 'Welcome back';
  static const loginSub = 'Log in to continue your streak.';
  static const loginPasswordHint = 'Enter your password';
  static const forgotPassword = 'Forgot password?';
  static const newHere = 'New here?';

  // Auth: Verify email
  static const verifyTitle = 'Check your email';
  static const verifySub = 'We sent a 6-digit code to';
  static const verifyEmail = 'Verify email';
  static const didNotGet = 'Did not get a code?';
  static const resendIn = 'Resend in';
  static const resend = 'Resend code';
  static const enterCode = 'Enter the 6-digit code';

  // Auth: Forgot password
  static const forgotTitle = 'Forgot password?';
  static const forgotSub = 'Enter your email and we will send you a link to reset your password.';
  static const sendResetLink = 'Send reset link';
  static const backToLogin = 'Back to log in';
  static const resetLinkSent = 'Reset link sent to';

  // Auth: Reset password
  static const resetTitle = 'New password';
  static const resetSub = 'Choose a strong password you have not used before.';
  static const newPassword = 'New password';
  static const newPasswordHint = 'Enter new password';
  static const confirmPassword = 'Confirm password';
  static const confirmPasswordHint = 'Repeat password';
  static const ruleLength = 'At least 8 characters';
  static const ruleNumber = 'One number';
  static const ruleSymbol = 'One symbol';
  static const resetPassword = 'Reset password';
  static const passwordUpdated = 'Password updated. Please log in.';

  // Common
  static String stepOf(int step, int total) => 'Step $step of $total';
  static const continueLabel = 'Continue';

  // Onboarding: Goals
  static const goalsTitle = 'What is your goal?';
  static const goalsSub = 'We will build your plan around it.';
  static const goalStrength = 'Build strength';
  static const goalWeight = 'Lose weight';
  static const goalActive = 'Stay active';
  static const goalFlexibility = 'Improve flexibility';

  // Onboarding: Plan setup
  static const planTitle = 'Set your plan';
  static const fitnessLevel = 'Fitness level';
  static const levelBeginner = 'Beginner';
  static const levelIntermediate = 'Intermediate';
  static const levelAdvanced = 'Advanced';
  static const daysPerWeek = 'Days per week';
  static const sessionLength = 'Session length';
  static const dailyReminder = 'Daily reminder';
  static const finishSetup = 'Finish setup';

  // Onboarding: Permission
  static const permissionTitle = 'Stay on track';
  static const permissionSub =
      'Get a gentle nudge at the time you choose, so your streak never slips.';
  static const benefitStreak = 'Never lose your streak';
  static const benefitTime = 'Reminders at your chosen time';
  static const benefitBadges = 'Badge and milestone alerts';
  static const turnOnReminders = 'Turn on reminders';
  static const notNow = 'Not now';

  // Home
  static const todaysWorkout = "TODAY'S WORKOUT";
  static const startWorkout = 'Start workout';
  static const programsForYou = 'Programs for you';
  static const kcalBurned = 'kcal burned';
  static const dayStreak = 'day streak';
  static const comingSoon = 'coming soon';
  static String ofMinutes(int m) => 'of $m min';

  // Home (functional)
  static const workoutCompleteToday = "Today's workout is complete. Great job!";
  static const completedLabel = 'Completed';
  static String exerciseDone(String name) => '$name done';
  static const demoReset = 'Demo data reset';

  // Login
  static const wrongCredentials = 'Wrong email or password';

  // Workouts
  static const workoutsTitle = 'Workouts';
  static const searchExercises = 'Search exercises';
  static const popularExercises = 'Popular exercises';
  static const challengeTag = '30-DAY CHALLENGE';
  static const challengeName = 'Home Strength';
  static String challengeDay(int d) => 'Day $d of 30';
  static const noResults = 'No exercises found';
  static const noResultsMsg = 'Try a different name or category.';

  // Exercise detail
  static const exerciseTitle = 'Exercise';
  static const watchDemo = 'Watch demo';
  static const targetMuscles = 'Target muscles';
  static const howTo = 'How to';
  static const addToWorkout = 'Add to workout';
  static const start = 'Start';

  // Workout flow
  static const todaysWorkoutTitle = "Today's workout";
  static const noEquipment = 'No equipment';
  static const getReady = 'Get ready';
  static const firstUp = 'FIRST UP';
  static const startNow = 'Start now';
  static const cancel = 'Cancel';
  static const secondsLabel = 'seconds';
  static const repsLabel = 'reps';
  static const setDone = 'Set done';
  static const upNext = 'UP NEXT';
  static const restTitle = 'Rest';
  static const addTenSeconds = '+10 sec';
  static const skipRest = 'Skip rest';
  static const finishWorkout = 'Finish workout';
  static const pausedTitle = 'Workout paused';
  static const pausedBar = 'Paused';
  static const resume = 'Resume';
  static const restartExercise = 'Restart exercise';
  static const endWorkout = 'End workout';
  static const summary = 'Summary';
  static const workoutComplete = 'Workout complete';
  static const timeLabel = 'Time';
  static const caloriesLabel = 'Calories';
  static const exercisesLabel = 'Exercises';
  static const streakLabel = 'Streak';
  static const howDidItFeel = 'How did it feel?';
  static const done = 'Done';
  static const viewProgress = 'View progress';
  static String setOf(int s, int t) => 'Set $s of $t';
  static String exerciseOf(int i, int t) => 'Exercise $i of $t';
  static String greatJob(String name) => 'Great job, $name. Keep it going.';

  // Progress tab
  static const progressTitle = 'Progress';
  static const activeMinutes = 'Active minutes';
  static const vsLastWeek = 'vs last week';
  static const bodyWeight = 'Body weight';
  static const logWeight = 'Log weight';
  static const achievementsTitle = 'Achievements';
  static const seeAll = 'See all';
  static const badge7Day = '7-day streak';
  static const badge10Workouts = '10 workouts';
  static const badgeEarlyBird = 'Early bird';

  // Profile tab
  static const profileTitle = 'Profile';
  static const workouts = 'Workouts';
  static const hours = 'Hours';
  static const bestStreak = 'Best streak';
  static const dailyGoal = 'Daily goal';
  static const editProfile = 'Edit profile';
  static const history = 'History';
  static const settings = 'Settings';
  static const logOut = 'Log out';
}
