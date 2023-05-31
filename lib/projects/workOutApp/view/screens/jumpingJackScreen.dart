// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/projects/workOutApp/model/model.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';
import '../widgets/circularProgressWidget.dart';
import 'exerciseScreen.dart';

class JumpingJackScreen extends StatefulWidget {
  JumpingJackScreen({Key? key, required this.exercises, required this.dayNo}) : super(key: key);

  late final List<Exercise> exercises;
  final int dayNo;

  @override
  State<JumpingJackScreen> createState() => _JumpingJackScreenState();
}

class _JumpingJackScreenState extends State<JumpingJackScreen> {

  Timer? _timer;
  int _currentSeconds = 0;
  double _progress = 0.0;
  int totalTime = 10;

  List<Exercise>? exercises;

  @override
  void initState() {
    super.initState();
    _currentSeconds = totalTime;
    startTimer();
    exercises = widget.exercises;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _currentSeconds--;
        _progress = (totalTime - _currentSeconds) / totalTime;
        if (_currentSeconds <= 0) {
          _timer?.cancel();
          navigateToNewScreen();
        }
      });
    });
  }

  void navigateToNewScreen() => Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => ExerciseScreen(exercises: exercises!,dayNo: widget.dayNo,)));


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsTheme.white,
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: h * 0.4,
                child: Lottie.asset(exercises![0].lottie)),
            SizedBox(height: 50),
            Text("Ready to Go",style: ThemeTexts.textStyleTitle2.copyWith(color: ColorsTheme.pink),),
            Text(exercises![0].name,style: ThemeTexts.textStyleTitle2.copyWith(color: ColorsTheme.black),),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50),
                SizedBox(
                  width: 170,
                  height: 170,
                  child: CustomPaint(
                    painter: CircleProgressBarPainter(
                      progress: _progress,
                      backgroundColor: Colors.pink.shade50,
                      progressColor: Colors.pink,
                    ),
                    child: Center(
                      child: Text(
                        '$_currentSeconds',
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: ()=> navigateToNewScreen(), icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
