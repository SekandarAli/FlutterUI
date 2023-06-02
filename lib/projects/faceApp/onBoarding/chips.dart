// ignore_for_file: prefer_const_constructors

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/projects/faceApp/onBoarding/planGeneration.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';

class Chips extends StatefulWidget {
  const Chips({Key? key}) : super(key: key);

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {

  List<String>? selectedOptions = [];
  List<String> options = ['Yoga','Finance','Health','Food','Business','Family','Store','Grocery','Entertainment','Laundry'];

  @override
  Widget build(BuildContext context) {
    double w =  MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesOne,
            fit: BoxFit.contain,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 0.5.sh,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  Text(
                    "Chips",
                    textAlign: TextAlign.center,
                    style: ThemeTexts.textStyleTitle1.copyWith(
                      color: ColorsTheme.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    "To the oral initrd blog in  island of the works dto the thing Beautiful",
                    textAlign: TextAlign.center,
                    style: ThemeTexts.textStyleTitle1.copyWith(
                      color: ColorsTheme.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: w,
                    color: ColorsTheme.transparent,
                    child: ChipsChoice<String>.multiple(
                      value: selectedOptions!,
                      onChanged: (val) => setState(() => selectedOptions = val),
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options,
                        value: (i, v) => v,
                        label: (i, v) => v,
                        style: (index, item) {
                          return C2ChipStyle.filled(
                            padding: EdgeInsets.all(5),
                            selectedStyle: C2ChipStyle(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.cyan,
                              foregroundStyle: TextStyle(color: Colors.white),
                            ),
                            foregroundStyle: TextStyle(color: Colors.black38),
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                          );
                        },
                      ),
                      padding: EdgeInsets.all(0),
                      wrapped: true,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 0.77,
                            strokeWidth: 5,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 60.sp,
                          height: 60.sp,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(
                                    () => Plan(),
                                transition: Transition.cupertinoDialog,
                                duration: const Duration(milliseconds: 0),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
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
                  Assets.imagesInstagram,
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


