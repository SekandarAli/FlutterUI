import 'package:task_list_app/generated/assets.dart';
import '../../model/model.dart';

class WorkoutPlanGenerator {
  List<WorkoutPlan> generateWorkoutPlans(String mode) {
    List<WorkoutPlan> workoutPlans = [];

    // Example workout plan generation for each day
    for (int i = 1; i <= 30; i++) {
      List<Exercise> exercises = [];

      // Example exercises for each day
      if (mode == "beginner") {
        // Generate beginner workout plan
        if (i % 2 == 0) {
          exercises.add(Exercise(
            name: "Push-ups",
            duration: 0,
            sets: 10,
            lottie: Assets.lottieLottieHandsNew
          ));
        } else {
          exercises.add(Exercise(
            name: "Squats",
            duration: 0,
            sets: 10,
            lottie: Assets.lottieLottieHandsNew
          ));
        }
      }
      else if (mode == "medium") {
        // Generate medium workout plan
        if (i % 2 == 0) {
          exercises.add(Exercise(
            name: "Push-ups",
            duration: 0,
            sets: 15,
            lottie: Assets.lottieLottieHandsNew
          ));
          exercises.add(Exercise(
            name: "Pull-ups",
            duration: 0,
            sets: 10,
            lottie: Assets.lottieLottieHandsNew
          ));
        }
        else {
          exercises.add(Exercise(
            name: "Squats",
            duration: 0,
            sets: 15,
            lottie: Assets.lottieLottieHandsNew
          ));
          exercises.add(Exercise(
            name: "Lunges",
            duration: 0,
            sets: 10,
            lottie: Assets.lottieLottieHandsNew
          ));
        }
      }
      else if (mode == "high") {
        // Generate high workout plan
        if (i % 2 == 0) {
          exercises.add(Exercise(
            name: "Push-ups",
            duration: 0,
            sets: 15,
            lottie: Assets.lottieLegs
          ));
          exercises.add(Exercise(
            name: "Pull-ups",
            duration: 0,
            sets: 12,
            lottie: Assets.lottieJumpingJack
          ));
          exercises.add(Exercise(
            name: "Planks",
            duration: 60,
            sets: 0,
            lottie: Assets.lottieAbs
          ));
          exercises.add(Exercise(
              name: "Squats",
              duration: 30,
              sets: 0,
              lottie: Assets.lottieCar1
          ));
          exercises.add(Exercise(
              name: "Sit-Ups",
              duration: 0,
              sets: 12,
              lottie: Assets.lottieOnBoard
          ));
          exercises.add(Exercise(
              name: "Jumping Jack",
              duration: 0,
              sets: 10,
              lottie: Assets.lottieLottieHandsNew
          ));
          exercises.add(Exercise(
              name: "Legs Raise",
              duration: 0,
              sets: 30,
              lottie: Assets.lottieAbs
          ));
          exercises.add(Exercise(
              name: "Cobra Stretch",
              duration: 20,
              sets: 0,
              lottie: Assets.lottieCar2
          ));
        }
        else{
          exercises.add(Exercise(
              name: "Jumping Jack",
              duration: 30,
              sets: 0,
              lottie: Assets.lottieJumpingJack
          ));
          exercises.add(Exercise(
              name: "Squats",
              duration: 0,
              sets: 20,
              lottie: Assets.lottieAbs
          ));
          exercises.add(Exercise(
              name: "Push-ups",
              duration: 0,
              sets: 15,
              lottie: Assets.lottieLegs
          ));
        }
      }

      workoutPlans.add(WorkoutPlan(day: i, exercises: exercises));
    }

    return workoutPlans;
  }
}