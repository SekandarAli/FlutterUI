// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(Assets.imagesTwo),
                Text("Challenge",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    textStyle: ThemeTexts.textStyleTitle1.copyWith(
                      color: ColorsTheme.white,fontWeight: FontWeight.bold,fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("You can walk the distance structure body hands to the words of the thing gifts.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    textStyle: ThemeTexts.textStyleTitle3.copyWith(
                      color: Colors.white38,fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  color: Colors.orange,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("End March 160KM Challenge",
                          style: GoogleFonts.almarai(
                            textStyle: ThemeTexts.textStyleTitle1.copyWith(
                              color: ColorsTheme.white,fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Complete the shadeless of 160km to achieve a rood height ure body hands thing gifts.",
                          style: GoogleFonts.almarai(
                            textStyle: ThemeTexts.textStyleTitle4.copyWith(
                                color: Colors.white70,fontWeight: FontWeight.normal
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width * 0.8,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: (){
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsTheme.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Text(
                                  "Join Challenge",textAlign: TextAlign.start,
                                  style: GoogleFonts.almarai(textStyle: ThemeTexts.textStyleTitle4.copyWith(color: ColorsTheme.black,fontWeight: FontWeight.bold,)),
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                  padding: EdgeInsets.all(2),
                                  child: Icon(CupertinoIcons.arrow_right,color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}