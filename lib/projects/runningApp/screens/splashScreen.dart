// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';
import 'package:task_list_app/projects/runningApp/screens/bottomNavigationScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _slideAnimation = Tween<Offset>(begin: Offset(1, 50), end: Offset.zero).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.fastLinearToSlowEaseIn));
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: ColorsTheme.white,
        width: width,
        child: Stack(
          children: [
            SlideTransition(
                position: _slideAnimation!,
                child: Image.asset(Assets.imagesRunningSplash,fit: BoxFit.cover,height: height,)),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text("LET'S RUN TOGETHER",style: GoogleFonts.almarai(fontStyle: FontStyle.italic,textStyle: ThemeTexts.textStyleTitle1.copyWith(color: ColorsTheme.white,fontWeight: FontWeight.bold,fontSize: 60,)),),
                    SizedBox(height: 10),
                    SlideTransition(
                      position: _slideAnimation!,
                      child: SizedBox(
                        width: width,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: (){
                            Get.to(() => BottomNavigationScreen(),
                              transition: Transition.cupertinoDialog,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                          ),
                          child: Text(
                            "GET STARTED",textAlign: TextAlign.start,
                            style: GoogleFonts.almarai(textStyle: ThemeTexts.textStyleTitle4.copyWith(color: ColorsTheme.white,fontWeight: FontWeight.bold,letterSpacing: 3)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
