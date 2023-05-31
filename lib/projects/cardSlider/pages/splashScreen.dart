// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';
import 'package:task_list_app/projects/cardSlider/pages/home_pages.dart';
import 'package:task_list_app/projects/databaseApp/utils/colors.dart';
import 'package:task_list_app/projects/runningApp/screens/bottomNavigationScreen.dart';

class SplashCardScreen extends StatefulWidget {
  const SplashCardScreen({Key? key}) : super(key: key);

  @override
  State<SplashCardScreen> createState() => _SplashCardScreenState();
}

class _SplashCardScreenState extends State<SplashCardScreen> with TickerProviderStateMixin{

  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;
  Animation<Offset>? _slideAnimationButton;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _slideAnimation = Tween<Offset>(begin: Offset(1, 50), end: Offset.zero).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.fastLinearToSlowEaseIn));
    _slideAnimationButton = Tween<Offset>(begin: Offset(1, 800), end: Offset.zero).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.easeOutQuint));
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
        child:  SlideTransition(
          position: _slideAnimation!,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.purple,
                      Colors.blue.shade900,
                      Colors.blue,
                    ],
                  ),
                ),
              ),
              Image.asset(
                'assets/images/others/Signal.png',
              ),
              Positioned(
                top: 32,
                left: 18,
                child: Image.asset(
                  'assets/images/others/Satelite.png',
                  width: 50,
                  height: 100
                ),
              ),
              Align(
                child: Image.asset(
                  'assets/images/others/Starts.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                top: 200,
                // bottom: 500,
                child: Image.asset(
                  'assets/images/others/Moon.png',
                ),
              ),
              Positioned(
                left: 20,
                bottom: 280,
                child: Image.asset(
                  'assets/images/others/Comet.png',
                  width: 30,
                  height: 20,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/others/Astronaut.png',
                  height: 150,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome\nto Space Area',
                      textAlign: TextAlign.center,
                      style: ThemeTexts.textStyleTitle1.copyWith(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SlideTransition(
                      position: _slideAnimationButton!,
                      child: SliderButton(
                        action: () {
                          Get.to(() => CardSlider(),
                            transition: Transition.cupertinoDialog,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        },
                        // dismissible: false,


                        ///Put label over here
                        label: Text(
                          "Slide to start !",
                          style: TextStyle(
                              color: Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        icon: Center(
                            child: Icon(
                              Icons.play_circle,
                              color: Colors.white,
                              size: 40.0,
                              semanticLabel: 'Text to announce in accessibility modes',
                            )),

                        //Put BoxShadow here
                        boxShadow: BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                        ),

                        //Adjust effects such as shimmer and flag vibration here
                        // shimmer: true,
                        // vibrationFlag: true,

                        ///Change All the color and size from here.
                        width: 230,
                        radius: 50,
                        height: 60,
                        buttonColor: MyColors.primaryColor,
                        backgroundColor: Colors.white60,
                        highlightedColor: Colors.white,
                        baseColor: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
