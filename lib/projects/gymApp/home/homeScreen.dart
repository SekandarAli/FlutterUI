// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/projects/gymApp/home/homeDetailScreen.dart';
import 'package:task_list_app/projects/gymApp/home/homeDetailScreen.dart';
import 'package:task_list_app/projects/gymApp/home/homeDetailScreen.dart';

import '../../../controller/active_app_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ActiveAppController _activeAppController = Get.put(ActiveAppController());
  late int activeValue;

  int index = 1;

  @override
  Widget build(BuildContext context) {
    activeValue = _activeAppController.activeApp.value;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsTheme.backgroundColor,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            width: width * 0.8,
            decoration: BoxDecoration(
              color: ColorsTheme.backgroundColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bottomNavigationIcons(
                    iconData: Icons.home_filled,
                    color: index == 1  ? Colors.white : Colors.grey,
                    containerColor: index == 1  ? Colors.black : ColorsTheme.backgroundColor,
                    onPress: (){
                      setState(() {
                        index = 1;});
                    },
                ),

                bottomNavigationIcons(
                  iconData: Icons.grid_view_rounded,
                  color: index == 2  ? Colors.white : Colors.grey,
                  containerColor: index == 2  ? Colors.black : ColorsTheme.backgroundColor,
                  onPress: (){
                    setState(() {
                      index = 2;
                    });
                    },
                ),

                bottomNavigationIcons(
                  iconData: CupertinoIcons.star_fill,
                  color: index == 3  ? Colors.white : Colors.grey,
                  containerColor: index == 3  ? Colors.black : ColorsTheme.backgroundColor,
                  onPress: (){
                    setState(() {
                      index = 3;
                    });
                    },
                ),

                bottomNavigationIcons(
                  iconData: Icons.featured_play_list_rounded,
                  color: index == 4  ? Colors.white : Colors.grey,
                  containerColor: index == 4  ? Colors.black : ColorsTheme.backgroundColor,
                  onPress: (){
                    setState(() {
                      index = 4;
                    });
                    },
                ),
              ],
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose Part', style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.search, color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                containerButtonStyle(
                  text: "Hands",
                  color: Colors.blue.shade100,
                  lottie: Lottie.asset(Assets.lottieHands),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailScreen(
                      color: Colors.blue.shade100,
                      iconBackgroundColor: Colors.blue.shade200,
                      lottieBuilder: Lottie.asset(Assets.lottieHands),
                    )));
                  },
                ),
                SizedBox(height: 10),
                containerButtonStyle(
                  text: "Abs",
                  color: Colors.pink.shade100,
                  lottie: Lottie.asset(Assets.lottieAbs),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailScreen(
                      color: Colors.pink.shade100,
                      iconBackgroundColor: Colors.pink.shade200,
                      lottieBuilder: Lottie.asset(Assets.lottieAbs),
                    )));
                  },
                ),
                SizedBox(height: 10),
                containerButtonStyle(
                  text: "Legs",
                  color: Colors.yellow.shade100,
                  lottie: Lottie.asset(Assets.lottieLegs),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailScreen(
                      color: Colors.yellow.shade100,
                      iconBackgroundColor: Colors.yellow.shade200,
                      lottieBuilder: Lottie.asset(Assets.lottieLegs),
                    )));
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerButtonStyle(
      {required String text, required Color color, required LottieBuilder lottie, required Function() onTap,}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            height: 175,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(child: lottie),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text(text, textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavigationIcons({required IconData iconData, required Color color,  required Color containerColor, required Function() onPress}){
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: IconButton(
        icon: Icon(iconData,),
        color: color,
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}

