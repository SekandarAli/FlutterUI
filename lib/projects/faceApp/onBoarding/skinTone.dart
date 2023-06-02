// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_list_app/projects/faceApp/onBoarding/age.dart';
import 'package:task_list_app/projects/faceApp/onBoarding/ageNew.dart';

class SkinTone extends StatefulWidget {
  const SkinTone({Key? key}) : super(key: key);

  @override
  State<SkinTone> createState() => _SkinToneState();
}

class _SkinToneState extends State<SkinTone> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String selectedImagePath = 'assets/images/earth.png';
  Color selectedColor = Color(0xff8d5524);

  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeImage(String imagePath, Color color) {
    setState(() {
      selectedImagePath = imagePath;
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(milliseconds: 500),
              // child: Image.asset(
              //   selectedImagePath,
              //   color: selectedColor,
              //   fit: BoxFit.cover,
              // ),
              child: Container(
                color: selectedColor,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(18.sp),
              child: Column(
                children: [
                  Text(
                    "Select your skin color",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    "To the oral initrd blog in island of the works dto the thing Beautiful",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SizedBox(height: 20.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ColorContainer(
                            color: Color(0xff8d5524),
                            imagePath: 'assets/images/earth.png',
                            isSelected: selectedColor == Color(0xff8d5524),
                            onTap: changeImage,
                          ),
                          ColorContainer(
                            color: Color(0xffc68642),
                            imagePath: 'assets/images/neptune.png',
                            isSelected: selectedColor == Color(0xffc68642),
                            onTap: changeImage,
                          ),
                          ColorContainer(
                            color: Color(0xffe0ac69),
                            imagePath: 'assets/images/uranus.png',
                            isSelected: selectedColor == Color(0xffe0ac69),
                            onTap: changeImage,
                          ),
                          ColorContainer(
                            color: Color(0xfff1c27d),
                            imagePath: 'assets/images/mercury.png',
                            isSelected: selectedColor == Color(0xfff1c27d),
                            onTap: changeImage,
                          ),
                          ColorContainer(
                            color: Color(0xffffdbac),
                            imagePath: 'assets/images/earth.png',
                            isSelected: selectedColor == Color(0xffffdbac),
                            onTap: changeImage,
                          ),
                          ColorContainer(
                            color: Color(0xffeff3f1),
                            imagePath: 'assets/images/saturn.png',
                            isSelected: selectedColor == Color(0xffeff3f1),
                            onTap: changeImage,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onHighlightChanged: (value) {
                        setState(() {
                          isTapped = value;
                        });
                      },
                      onTap: () {
                        Get.to(()=> Age());
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: isTapped ? 60 : 65,
                        width: isTapped ? 60 : 65,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
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
                            color: Colors.white ,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Positioned(
            top: 30.sp,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/instagram.png',
                  width: 30.sp,
                  height: 30.sp,
                ),
                Text("skip"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorContainer extends StatefulWidget {
  final Color color;
  final String imagePath;
  final bool isSelected;
  final Function(String, Color) onTap;

  const ColorContainer({
    Key? key,
    required this.color,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _ColorContainerState createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap(widget.imagePath, widget.color);
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                width: 50.sp,
                height: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color,
                  border: Border.all(
                    color: widget.isSelected ? Colors.cyan : Colors.transparent,
                    width: 5,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
