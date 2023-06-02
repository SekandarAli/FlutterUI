// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';

import '../../workOutApp/view/screens/exerciseScreen.dart';
import 'skinTone.dart';

class FaceSplashScreen extends StatefulWidget {
  const FaceSplashScreen({Key? key}) : super(key: key);

  @override
  State<FaceSplashScreen> createState() => _FaceSplashScreenState();
}

class _FaceSplashScreenState extends State<FaceSplashScreen> with TickerProviderStateMixin{

  AnimationController? _slideAnimationController;
  Animation<Offset>? _slideAnimation;

  AnimationController? _circularAnimationController;
  Animation<double>? _circularAnimation;

  @override
  void dispose() {
    _slideAnimationController!.dispose();
    _circularAnimationController?.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _slideAnimation = Tween<Offset>(begin: Offset(1, 50), end: Offset.zero).animate(CurvedAnimation(
        parent: _slideAnimationController!, curve: Curves.fastLinearToSlowEaseIn));
    _slideAnimationController!.forward();

    _circularAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _circularAnimation = Tween<double>(begin: 0, end: 1).animate(_circularAnimationController!);

    _circularAnimationController!.forward();

    _circularAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       navigateToNewScreen();
      }
    });
  }

  void navigateToNewScreen(){
    Get.off(() => SkinTone(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
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
                child: Image.asset(Assets.imagesSpace,fit: BoxFit.cover,height: height,)),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    SlideTransition(
                      position: _slideAnimation!,
                      child: Text("Stay Young & Beautiful",
                          textAlign: TextAlign.center,
                          style: ThemeTexts.textStyleTitle1.copyWith(
                              color: ColorsTheme.black,fontWeight: FontWeight.bold,fontSize: 45.sp,
                          ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SlideTransition(
                        position: _slideAnimation!,
                        child: AnimatedBuilder(
                            animation: _circularAnimationController!,
                            builder: (context,child) {
                              return SizedBox(
                                width: 60.sp,
                                height: 60.sp,
                                child: CircularProgressIndicator(
                                  value: _circularAnimation!.value,
                                  strokeWidth: 5,
                                  backgroundColor: Colors.grey,
                                ),
                              );
                            }
                            ),
                      ),
                    ),
                   /* SlideTransition(
                      position: _slideAnimation!,
                      child: SizedBox(
                        width: 60.sp,
                        height: 60.sp,
                        child: ElevatedButton(
                          onPressed: (){
                            navigateToNewScreen();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                          ),
                          child: Icon(Icons.arrow_forward,color: Colors.white,)
                        ),
                      ),
                    ),*/
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

class CircleProgressBarPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  CircleProgressBarPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 5.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircleProgressBarPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        backgroundColor != oldDelegate.backgroundColor ||
        progressColor != oldDelegate.progressColor;
  }
}
