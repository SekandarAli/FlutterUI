// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/color.dart';
import '../home/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsTheme.backgroundColor,
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesOne),

                Text("Keep your life", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 2)),
                SizedBox(height: 0),
                Text("organized", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 2,color: ColorsTheme.textColorOrange)),
                SizedBox(height: 20),
                Text("The smart tool is designed to help\nyou better manage your tasks.", style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: ColorsTheme.grey)),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsTheme.black,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(Icons.arrow_forward_ios_rounded,color: ColorsTheme.white),
                ),
              ],
            ),
          )
      ),
    );
  }
}


