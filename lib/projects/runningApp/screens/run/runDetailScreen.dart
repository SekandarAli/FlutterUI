// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import '../../../../generated/assets.dart';
import '../../../../styles/color.dart';
import '../../../../styles/text_styles.dart';

class RunDetailScreen extends StatefulWidget {
  const RunDetailScreen({Key? key}) : super(key: key);

  @override
  State<RunDetailScreen> createState() => _RunDetailScreenState();
}

class _RunDetailScreenState extends State<RunDetailScreen> with TickerProviderStateMixin{

  Location location = Location();
  double speed = 0;
  StreamSubscription<LocationData>? locationSubscription;

  @override
  void initState() {
    super.initState();
    startListening();
  }

  @override
  void dispose() {
    locationSubscription?.cancel(); // Cancel the location subscription
    super.dispose();
  }

  void startListening() {
    locationSubscription = location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          speed = currentLocation.speed ?? 0;
        });
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
            Image.asset(Assets.imagesRunDetailBg,fit: BoxFit.fitHeight,height: height),
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.all(15),
              // color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 50),
                  Text("Wednesday\nMorning Run",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.almarai(
                      textStyle: ThemeTexts.textStyleTitle1.copyWith(
                        color: ColorsTheme.white,fontWeight: FontWeight.bold,fontSize: 30,
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(speed.toStringAsFixed(2).replaceAll(".", ","),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.almarai(
                          textStyle: ThemeTexts.textStyleTitle1.copyWith(
                            color: ColorsTheme.white,fontWeight: FontWeight.bold,fontSize: 80,
                          ),
                        ),
                      ),
                      Text("Kilometers",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.almarai(
                          textStyle: ThemeTexts.textStyleTitle3.copyWith(
                            color: ColorsTheme.white,fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      containerStyle(iconData: Icons.access_time, text1: "Time", text2: "44.25",showDivider: true),
                      containerStyle(iconData: Icons.directions_run, text1: "Avg Pace", text2: "15.35",showDivider: true),
                      containerStyle(iconData: Icons.local_fire_department_outlined, text1: "Calories", text2: "308",showDivider: true),
                      containerStyle(iconData: Icons.school_outlined, text1: "Elevation Gain", text2: "33m",showDivider: false),
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget containerStyle({required IconData iconData,required String text1,required String text2,required bool showDivider,}){
    return Column(
      children: [
        Row(
          children: [
            Icon(iconData,size: 30,color: ColorsTheme.white,),
            SizedBox(width: 20),
            Text(text1,
              textAlign: TextAlign.start,
              style: GoogleFonts.almarai(
                textStyle: ThemeTexts.textStyleTitle3.copyWith(
                    color: ColorsTheme.white,fontWeight: FontWeight.normal,letterSpacing: 2
                ),
              ),
            ),
            Spacer(),
            Text(text2,
              textAlign: TextAlign.start,
              style: GoogleFonts.almarai(
                textStyle: ThemeTexts.textStyleTitle3.copyWith(
                  color: ColorsTheme.white,fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        showDivider == true ? Divider(color: Colors.white) : Container(),
        SizedBox(height: 10),
      ],
    );
  }
}
