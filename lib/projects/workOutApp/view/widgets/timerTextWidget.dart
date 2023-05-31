// ignore_for_file: prefer_const_constructors, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../reusingWidgets/reusingWidgets.dart';
import '../../../../styles/color.dart';
import '../../../../styles/text_styles.dart';

class TimerScreenButtons extends StatefulWidget {
  TimerScreenButtons({super.key, });


  @override
  _TimerScreenButtonsState createState() => _TimerScreenButtonsState();
}

class _TimerScreenButtonsState extends State<TimerScreenButtons> {

  int remainingSeconds = 20;
  int buttonClickCount = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (remainingSeconds < 1) {
        timer?.cancel();
        Navigator.pop(context);
        // widget.onSkipPress();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void addButtonClick() {
    if (buttonClickCount < 4) {
      setState(() {
        remainingSeconds += 20;
        buttonClickCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = remainingSeconds.toString().padLeft(2, '0');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('00:$formattedTime',style: ThemeTexts.textStyleTitle1.copyWith(color: ColorsTheme.black),),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetsReUsing.buttonStyleRestScreen(
                context: context,
                onPress: (){
                  addButtonClick();
                },
                text: "+20s",
                color: Colors.black87,
                bgColor: ColorsTheme.lightGrey,
              ),

              WidgetsReUsing.buttonStyleRestScreen(
                context: context,
                onPress: (){
                  // widget.onSkipPress();
                  Navigator.pop(context);
                },
                text: "Skip",
                color: ColorsTheme.white,
                bgColor: ColorsTheme.pink,
              )
            ],
          ),
        ],
      ),
    );
  }
}


/*
class TimerScreen extends StatefulWidget {
  TimerScreen({Key? key, required this.isPaused}) : super(key: key);

  bool isPaused = false;

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int remainingSeconds = 30;
  Timer? timer;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (remainingSeconds <= 0 || isPaused) {
        timer?.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  void pauseTimer() {
    setState(() {
      isPaused = true;
    });
  }

  void resumeTimer() {
    setState(() {
      isPaused = false;
      startTimer();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = remainingSeconds.toString().padLeft(2, '0');
    return Center(
      child: Column(
        children: [
          Text(
            '00:$formattedTime',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 100,
            height: 100,
            child: ElevatedButton(
              onPressed:isPaused ? resumeTimer : pauseTimer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(15),
              ),
              child: Icon(isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,size: 50,color: ColorsTheme.pink,),
            ),
          ),
        ],
      ),
    );
  }
}
*/
