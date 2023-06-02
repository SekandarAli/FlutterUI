import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Plan extends StatefulWidget {
  const Plan({Key? key}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> with TickerProviderStateMixin {
  AnimationController? _circularAnimationController;
  Animation<double>? _circularAnimation;
  double _currentValue = 0.0;
  bool isTapped = false;

  // late AnimationController _animationController1;
  // late AnimationController _animationController2;
  // late AnimationController _animationController3;


  @override
  void dispose() {
    _circularAnimationController!.dispose();
    // _animationController1.dispose();
    // _animationController2.dispose();
    // _animationController3.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startAnimation();
    // _animationController1 = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 3),
    // );
    // _animationController2 = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 3),
    // );
    // _animationController3 = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 3),
    // );
    // Future.delayed(const Duration(milliseconds: 5000), () {
    //   _animationController1.forward();
    // });
    //
    // Future.delayed(const Duration(milliseconds: 700), () {
    //   _animationController2.forward();
    // });
    //
    // Future.delayed(const Duration(milliseconds: 900), () {
    //   _animationController3.forward();
    // });
  }

  startAnimation() {
    if (_circularAnimationController != null) {
      _circularAnimationController!.dispose();
    }

    _circularAnimationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _circularAnimation = Tween<double>(begin: 0, end: 1).animate(_circularAnimationController!);

    _circularAnimation!.addListener(() {
      setState(() {
        _currentValue = _circularAnimation!.value * 100;
      });
    });

    // Future.delayed(const Duration(milliseconds: 1200), () {
      _circularAnimationController!.forward();
    // });

    _circularAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToNewScreen();
      }
    });
  }

  void navigateToNewScreen() {
    // Get.off(() => SkinTone(),
    //   transition: Transition.cupertinoDialog,
    //   duration: const Duration(milliseconds: 1000),
    //   curve: Curves.fastOutSlowIn,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedIcon(
            //   icon: AnimatedIcons.home_menu,
            //   progress: _animationController1,
            //   size: 50.0,
            //   color: Colors.blue,
            // ),
            //
            //
            // AnimatedIcon(
            //   icon: AnimatedIcons.home_menu,
            //   progress: _animationController2,
            //   size: 50.0,
            //   color: Colors.blue,
            // ),
            //
            // AnimatedIcon(
            //   icon: AnimatedIcons.home_menu,
            //   progress: _animationController3,
            //   size: 50.0,
            //   color: Colors.blue,
            // ),

            Container(
              height: 150,
              color: Colors.orange,
            ),
           /* Container(
              width: 20.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan.shade100,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedBuilder(
                    animation: _circularAnimationController!,
                    builder: (context, child) {
                      return Container(
                        width: 280.sp,
                        height: 280.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: CircularProgressIndicator(
                          value: _circularAnimation!.value,
                          strokeWidth: 20,
                          backgroundColor: Colors.grey,
                        ),
                      );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${_currentValue.toInt()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 90.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                ],
              ),
            ),*/
            Stack(
              children: [
                Positioned(
                  top: 15.sp,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade100,
                        shape: BoxShape.circle,
                      ),
                      width: 220.sp,
                      height: 220.sp,
                      child: Center(
                        child: Text(
                          "${_currentValue.toInt()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 90.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedBuilder(
                    animation: _circularAnimationController!,
                    builder: (context, child) {
                      return Container(
                        width: 250.sp,
                        height: 250.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: CircularProgressIndicator(
                          value: _circularAnimation!.value,
                          strokeWidth: 20,
                          backgroundColor: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onHighlightChanged: (value) {
                  setState(() {
                    isTapped = value;
                  });
                },
                onTap: () {},
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: isTapped ? 55 : 65,
                  width: isTapped ? 55 : 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        offset: Offset(3, 7),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


