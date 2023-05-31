// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/color.dart';

import '../../../controller/active_app_controller.dart';

class HomeDetailScreen extends StatefulWidget {
   HomeDetailScreen({super.key,required this.color,required this.iconBackgroundColor, required this.lottieBuilder});

   Color color;
   Color iconBackgroundColor;
   LottieBuilder lottieBuilder;

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {


  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.iconBackgroundColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: widget.iconBackgroundColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Icon(CupertinoIcons.square_arrow_down_fill,color: Colors.black,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(0),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(child: widget.lottieBuilder),
                ),
                SizedBox(height: 30),
                Text('Legs workout set', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(height: 10),
                Text('These movement fours on the major things of the world to introduce it to a new way of the things.', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    containerStyle(
                        color: Colors.green.shade100,
                        iconData: Icons.time_to_leave,
                        text1: "11",
                        text2: "exercise",
                    ),

                    containerStyle(
                        color: Colors.orange.shade100,
                        iconData: Icons.timer_rounded,
                        text1: "30 - 35",
                        text2: "mins",
                    ),

                    containerStyle(
                        color: Colors.cyan.shade100,
                        iconData: Icons.face,
                        text1: "Entry",
                        text2: "level",
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return null!;}));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsTheme.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60,vertical: 22),
                  ),
                  child: Text(
                    "Next",textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerStyle({required Color color,required IconData iconData,required String text1,required String text2,}){
    return Container(
      padding: EdgeInsets.all(0),
      height: 120,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, color:Colors.black,size: 40),
          SizedBox(height: 10),
          Text(text1, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
          Text(text2, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),),
        ],
      ),
    );
  }
}

