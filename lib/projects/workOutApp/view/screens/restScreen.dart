// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/projects/workOutApp/model/model.dart';
import 'package:task_list_app/projects/workOutApp/view/widgets/timerTextWidget.dart';
import 'package:task_list_app/styles/color.dart';
import '../../../../generated/assets.dart';
import '../../../../styles/text_styles.dart';

class RestScreen extends StatefulWidget {
  RestScreen({Key? key, required this.currentExercise}) : super(key: key);

  Exercise? currentExercise;

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.play(AssetSource("audio/take_a_breath_in.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text('Rest',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 10),
              TimerScreenButtons(),
              SizedBox(height: 50),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Next",style: ThemeTexts.textStyleTitle3.copyWith(color: Colors.blueGrey),),
                  Text("3/14",style: ThemeTexts.textStyleTitle3.copyWith(color: Colors.blueGrey),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.currentExercise!.name,style: ThemeTexts.textStyleTitle3.copyWith(color: Colors.black),),
                  Text(widget.currentExercise!.sets ==0 ? "00:${widget.currentExercise!.duration.toString()}" : "x${widget.currentExercise!.sets.toString()}",style: ThemeTexts.textStyleTitle3.copyWith(color: Colors.black),),
                ],
              ),
              Lottie.asset(widget.currentExercise!.lottie),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
