// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/projectScreen.dart';
import 'package:task_list_app/projects/workOutApp/model/model.dart';
import 'package:task_list_app/projects/workOutApp/view/screens/restScreen.dart';
import 'package:task_list_app/projects/workOutApp/view/screens/resultScreen.dart';
import 'package:task_list_app/reusingWidgets/reusingWidgets.dart';
import 'package:task_list_app/styles/color.dart';
import '../../../../styles/text_styles.dart';

class ExerciseScreen extends StatefulWidget {
  final List<Exercise> exercises;
  final int dayNo;
  const ExerciseScreen({Key? key,required this.exercises,required this.dayNo}) : super(key: key);
  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> with TickerProviderStateMixin{

  int currentExerciseIndex = 0;
  int remainingSeconds = 30;
  Timer? timer;
  bool isPaused = false;
  AnimationController? _controller;
  AudioPlayer audioPlayer = AudioPlayer();

  // late Exercise currentExercise;

  @override
  void initState() {
    super.initState();
    // currentExercise = widget.exercises[currentExerciseIndex];
    audioPlayer.play(AssetSource("audio/hold_your_breath.mp3"));
    _controller = AnimationController(vsync: this);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if ( isPaused) {
        timer?.cancel();
      }
      else if (remainingSeconds <= 0 ) {
        timer?.cancel();
        _startNextExercise();
        navigateToNewScreen();
        remainingSeconds = 30;
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
    if (mounted) {
      _controller?.dispose();
    }
    super.dispose();
  }

  void toggleTimer() {
    if (isPaused) {
      resumeTimer();
      _controller?.repeat();
    } else {
      pauseTimer();
      _controller?.stop();
    }
  }

  void navigateToNewScreen() => Navigator.push(context, CupertinoPageRoute(builder: (context) => RestScreen(currentExercise: widget.exercises[currentExerciseIndex])));

  void _startNextExercise() {
    if (currentExerciseIndex < widget.exercises.length - 1) {
      setState(() {
        currentExerciseIndex++;
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(exercise: widget.exercises,dayNo: widget.dayNo,)));
    }
  }


  @override
  Widget build(BuildContext context) {
    String formattedTime = remainingSeconds.toString().padLeft(2, '0');
    Exercise currentExercise = widget.exercises[currentExerciseIndex];
    return WillPopScope(
      onWillPop: () async {
        await showModalBottomSheet(
        context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(30)),
          ),
        builder: ((builder) {
          return bottomSheet();
        }),
        );
        return null!;
      },
      child: Scaffold(
        backgroundColor: ColorsTheme.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(CupertinoIcons.arrow_left_circle,color: ColorsTheme.black,size: 30,)),
                    Text('Exercise ${currentExerciseIndex + 1}/${widget.exercises.length}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: LottieBuilder.asset(
                    currentExercise.lottie,
                    controller: _controller,
                    onLoaded: (composition) {
                      if (_controller != null) {
                        _controller!.duration = composition.duration;
                        _controller!.repeat();
                      }
                    },
                  ),
                ),
                // SizedBox(
                //     height: MediaQuery.of(context).size.height * 0.4,
                //     child: Lottie.asset(currentExercise.lottie)),
                SizedBox(height: 50),
                Text("${currentExercise.name}\n",style: ThemeTexts.textStyleTitle1.copyWith(color: ColorsTheme.black),),
                currentExercise.sets == 0 ?
                Center(
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
                          onPressed: toggleTimer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Icon(
                            isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                            size: 50,
                            color: ColorsTheme.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ) :
                Column(
                  children: [
                    Text("x${currentExercise.sets.toString()}",style: ThemeTexts.textStyleTitle2.copyWith(color: Colors.blueGrey,fontSize: 40),),
                    SizedBox(height: 50),
                    WidgetsReUsing.buttonStyleWorkOut(
                      onPress: (){
                        _startNextExercise();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RestScreen(currentExercise: currentExercise)));
                      },
                      text: "Done", context: context,),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetsReUsing.buttonStyleWorkOut2(
                      onPress: (){},
                      icon: Icons.skip_previous_rounded,
                      text: "Previous", context: context,),
                    WidgetsReUsing.buttonStyleWorkOut2(
                      onPress: (){
                        _startNextExercise();
                        navigateToNewScreen();
                        remainingSeconds = 30;
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RestScreen(currentExercise: currentExercise)));
                      },
                      icon: Icons.skip_next_rounded,
                      text: "Skip", context: context,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "😋",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Are you sure you want to Quit Exercise?",textAlign: TextAlign.center,
            style: ThemeTexts.textStyleTitle1.copyWith(wordSpacing: 1),
          ),

          SizedBox(height: 20),
          WidgetsReUsing.exitExerciseButtons(
              context: context,
              onPress: ()=> Navigator.pop(context),
              text: "Close",
              border: Border.all(width: 0, color: Colors.transparent),
              bgColor: Colors.pink.shade50,
              textColor: ColorsTheme.pink
          ),
          SizedBox(height: 10),
          WidgetsReUsing.exitExerciseButtons(
              context: context,
              onPress: ()=> Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => ProjectScreen())),
              text: "Quit",
              border: Border.all(width: 1, color: Colors.grey),
              bgColor: Colors.white,
              textColor: ColorsTheme.grey
          ),
        ],
      ),
    );
  }
}
