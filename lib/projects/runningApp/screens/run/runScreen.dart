// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/projects/runningApp/screens/run/runDetailScreen.dart';
import '../../../../generated/assets.dart';
import '../../../../styles/color.dart';
import '../../../../styles/text_styles.dart';

class RunScreen extends StatefulWidget {
  const RunScreen({Key? key}) : super(key: key);

  @override
  State<RunScreen> createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> with TickerProviderStateMixin{

  AnimationController? _screenAnimationController;
  AnimationController? _animationController;
  int _countdown = 10;
  bool showCountDown = false;

  @override
  void initState() {
    super.initState();
    _screenAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _screenAnimationController!.forward();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _countdown),
    );
  }

  @override
  void dispose() {
    _screenAnimationController!.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _animationController!.reverse(from: 1).whenCompleteOrCancel(() {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
        _startCountdown();
      } else {
        Get.to(() => RunDetailScreen(),
          transition: Transition.zoom,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
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
            Image.asset(Assets.imagesMap,fit: BoxFit.fitHeight,height: height),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text("ARE YOU READY?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.almarai(
                        fontStyle: FontStyle.italic,
                        textStyle: ThemeTexts.textStyleTitle1.copyWith(
                            color: ColorsTheme.white,fontWeight: FontWeight.bold,fontSize: 60,letterSpacing: 2,
                        ),
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: width,
                    height: height * 0.25,
                    child: showCountDown == false ? InkWell(
                      onTap: (){
                        setState(() {
                          showCountDown = !showCountDown;
                        });
                        _startCountdown();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Lottie.asset(Assets.lottieGoButton,width: 180,height: 180,fit: BoxFit.cover),
                          Text("Go!", style: GoogleFonts.almarai(fontStyle: FontStyle.italic,textStyle: ThemeTexts.textStyleTitle2.copyWith(color: ColorsTheme.white,fontWeight: FontWeight.bold,)),)
                        ],
                      ),
                    ) :
                    AnimatedBuilder(
                      animation: _screenAnimationController!,
                      builder: (context, child) {
                        return Center(
                          child: Text(_countdown.toString(),
                            style: GoogleFonts.almarai(
                                fontStyle: FontStyle.italic,
                                textStyle: ThemeTexts.textStyleTitle1.copyWith(
                                  color: ColorsTheme.white,fontWeight: FontWeight.bold,fontSize: 50)),)

                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
