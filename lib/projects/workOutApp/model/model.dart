// Exercise model
class Exercise {
  final String name;
  final int duration;
  final int sets;
  final String lottie;

  Exercise({
    required this.name,
    required this.duration,
    required this.sets,
    required this.lottie,
  });
}

// Workout plan model
class WorkoutPlan {
  final int day;
  final List<Exercise> exercises;

  WorkoutPlan({
    required this.day,
    required this.exercises,
  });
}