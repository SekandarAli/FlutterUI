// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_list_app/projects/workOutApp/model/model.dart';
import 'package:task_list_app/projects/workOutApp/view/screens/homeScreen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../viewModel/workOutPlanGenerate.dart';

class DayListScreen extends StatefulWidget {
  const DayListScreen({super.key});

  @override
  State<DayListScreen> createState() => _DayListScreenState();
}

class _DayListScreenState extends State<DayListScreen> {
  final WorkoutPlanGenerator generator = WorkoutPlanGenerator();
  WorkoutPlan? plan;

  @override
  Widget build(BuildContext context) {
    List<WorkoutPlan> workoutPlans = generator.generateWorkoutPlans("high");
    return Scaffold(
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemCount: workoutPlans.length,
          itemBuilder: (context, index) {
            WorkoutPlan plan = workoutPlans[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 900),
              columnCount: 5,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreenWorkOut(plan.exercises,plan.day)));
                },
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: GridTile(
                      child: Container(
                        color: Colors.pink.shade200,
                        child: Center(
                          child:Text('Day\n${plan.day}',textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

