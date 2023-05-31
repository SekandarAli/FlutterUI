// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/projects/workOutApp/view/screens/exerciseScreen.dart';
import 'package:task_list_app/projects/workOutApp/view/screens/jumpingJackScreen.dart';
import 'package:task_list_app/reusingWidgets/reusingWidgets.dart';
import 'package:task_list_app/styles/color.dart';
import '../../model/model.dart';

class HomeScreenWorkOut extends StatelessWidget {
  final List<Exercise> exercises;
  final int dayNo;
  HomeScreenWorkOut(this.exercises,this.dayNo);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return  Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(Assets.imagesOne, width: w, height: h * 0.3, fit: BoxFit.cover, alignment: Alignment.topRight),
                ),
                Container(
                  width: w,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Body",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTheme.black,
                                  letterSpacing: 2,
                                ),
                              ),
                              Text(
                                "7 x 4 Challenge",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsTheme.grey,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.settings)),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          rowStyle(text1: "Duration", text2: "${(exercises.length) * 35}s"),
                          rowStyle(text1: "Exercise", text2: "${exercises.length}"),
                          rowStyle(text1: "Kcal", text2: "33.254"),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Day ${dayNo.toString()}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorsTheme.black,
                              letterSpacing: 0,
                            ),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.swap_vert_rounded)),
                        ],
                      ),
                      Divider(),
                      Text(
                        "Exercises",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.black,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          itemCount: exercises.length,
                          itemBuilder: (context, index) {
                            Exercise exercise = exercises[index];

                            return listTile(
                                text1: exercise.name,
                                text2: exercise.duration != 0 ? "00:${exercise.duration.toString()}" : "x ${exercise.sets.toString()}",
                                lottie: exercise.lottie,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton:
        WidgetsReUsing.buttonStyleWorkOut(
          onPress: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context) =>  JumpingJackScreen(exercises: exercises,dayNo: dayNo,)));
          },
          text: "Start Now", context: context,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Widget rowStyle({required String text1,required String text2,}){
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: ColorsTheme.grey),
        ),
        Text(
          text2,
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: ColorsTheme.black),
        ),
      ],
    );
  }

  Widget listTile({required String text1,required String text2,required String lottie}){
    return Column(
      children: [
        ListTile(
          leading: Lottie.asset(lottie,width: 50,height: 50),
          title:  Text(
            text1,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ColorsTheme.black),
          ),
          subtitle:Text(
            text2,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey.shade700),
          ),
        ),
        Divider(),
      ],
    );
  }

}


