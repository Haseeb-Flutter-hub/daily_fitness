import 'models/exercise.dart';
import 'models/program.dart';

const sampleExercises = <Exercise>[
  Exercise('Push-ups', 'Chest, triceps', 'Upper body', 'Beginner',
      sets: 3, reps: 12, minutes: 4, kcal: 35, steps: [
    'Start in a high plank, hands under shoulders.',
    'Lower your chest until it nearly touches the floor.',
    'Push back up while keeping your body straight.',
  ]),
  Exercise('Squats', 'Legs, glutes', 'Lower body', 'Beginner',
      sets: 3, reps: 15, minutes: 4, kcal: 40, steps: [
    'Stand with feet shoulder-width apart.',
    'Sit your hips back and down, chest up.',
    'Drive through your heels to stand.',
  ]),
  Exercise('Plank', 'Core', 'Core', 'Beginner',
      sets: 3, seconds: 40, minutes: 4, kcal: 25, steps: [
    'Place forearms on the floor, elbows under shoulders.',
    'Lift hips so your body forms a straight line.',
    'Brace your core, breathe steadily and hold.',
  ]),
  Exercise('Lunges', 'Legs', 'Lower body', 'Beginner',
      sets: 3, reps: 12, minutes: 4, kcal: 40, steps: [
    'Stand tall, then step one foot far forward.',
    'Lower until both knees are bent at 90 degrees.',
    'Push through the front heel and switch legs.',
  ]),
  Exercise('Jumping jacks', 'Cardio', 'Cardio', 'Beginner',
      sets: 3, seconds: 30, minutes: 4, kcal: 45, steps: [
    'Stand with feet together, arms at your sides.',
    'Jump feet apart while raising arms overhead.',
    'Jump back to the start at a steady rhythm.',
  ]),
  Exercise('Glute bridge', 'Glutes, core', 'Core', 'Beginner',
      sets: 3, reps: 15, minutes: 4, kcal: 30, steps: [
    'Lie on your back, knees bent, feet flat.',
    'Press through your heels to lift your hips.',
    'Squeeze at the top for 2 seconds, then lower.',
  ]),
  Exercise('Mountain climbers', 'Cardio, core', 'Cardio', 'Intermediate',
      sets: 3, seconds: 30, minutes: 4, kcal: 45, steps: [
    'Start in a high plank position.',
    'Drive one knee toward your chest.',
    'Switch legs quickly while keeping hips low.',
  ]),
  Exercise('Chair dips', 'Triceps', 'Upper body', 'Beginner',
      sets: 3, reps: 10, minutes: 4, kcal: 30, steps: [
    'Sit on a sturdy chair, hands beside your hips.',
    'Slide forward and lower by bending your elbows.',
    'Press back up until your arms are straight.',
  ]),
];

/// Aaj ka workout ("Full Body Burn"): pehli 6 exercises.
final List<Exercise> todaysPlan = sampleExercises.take(6).toList();

const sampleProgramsForYou = <Program>[
  Program('Core Crusher', '20 min · Abs', 'Intermediate'),
  Program('Lower Body Power', '30 min · Legs', 'Beginner'),
  Program('Cardio Blast', '25 min · Cardio', 'Beginner'),
];
