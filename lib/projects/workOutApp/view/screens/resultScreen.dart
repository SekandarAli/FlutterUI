// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/projectScreen.dart';
import 'package:task_list_app/projects/workOutApp/model/model.dart';
import 'package:task_list_app/reusingWidgets/reusingWidgets.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';
import '../widgets/circularProgressWidget.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.exercise, required this.dayNo}) : super(key: key);

  List<Exercise> exercise;
  final int dayNo;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsTheme.lightGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          width: w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Lottie.asset(Assets.lottieTrophy)),
              SizedBox(height: 0),
              Text("Well Done",style: ThemeTexts.textStyleTitle1.copyWith(color: ColorsTheme.black),),
              SizedBox(height: 5),
              Text("You have finished your workout",style: ThemeTexts.textStyleTitle3.copyWith(color: Colors.blueGrey)),
              SizedBox(height: 20),
              Container(
                width: w * 0.9,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorsTheme.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Day $dayNo Completed",style: ThemeTexts.textStyleTitle2.copyWith(color: ColorsTheme.black),),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rowStyle(text1: "Duration", text2: "${exercise.length * 35}s"),
                        rowStyle(text1: "Exercise", text2: exercise.length.toString()),
                        rowStyle(text1: "Kcal", text2: "33.254"),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rowStyle2(text: "10:30\nduration", color: Colors.pink.shade100),
                        rowStyle2(text: "11\nexercise", color: Colors.orange.shade100),
                        rowStyle2(text: "0.125\nkCal", color: Colors.yellow.shade100),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: w * 0.9,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorsTheme.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Weight Log",style: ThemeTexts.textStyleTitle2.copyWith(color: ColorsTheme.black),),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            rowStyle(text1: "Starting Weight", text2: "82KG"),
                            rowStyle(text1: "Target Weight", text2: "75KG"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            rowStyle2(text: "0.254 KG\nWeight loss", color: Colors.green.shade100),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                  ],
                ),
              ),
              SizedBox(height: 20),
              WidgetsReUsing.buttonStyleWorkOut(
                onPress: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context) =>  ProjectScreen()));
                },
                text: "Home", context: context,),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget rowStyle({required String text1,required String text2,}){
    return Column(
      children: [
        Text(
          text1,textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: ColorsTheme.grey),
        ),
        Text(
          text2,textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: ColorsTheme.black),
        ),
      ],
    );
  }

  Widget rowStyle2({required String text,required Color color,}){
    return SizedBox(
      width: 90,
      height: 90,
      child: CustomPaint(
        painter: CircleProgressBarPainter(
          progress: 30,
          backgroundColor: Colors.pink.shade50,
          progressColor: color,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

}
