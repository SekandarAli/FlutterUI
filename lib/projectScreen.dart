// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_app/projects/cardSlider/pages/splashScreen.dart';
import 'package:task_list_app/projects/charts/charts.dart';
import 'package:task_list_app/projects/customChart/customCharts.dart';
import 'package:task_list_app/projects/databaseApp/data/hive_data_store.dart';
import 'package:task_list_app/projects/databaseApp/view/home/home_view.dart';
import 'package:task_list_app/projects/gymApp/onBoarding/onBoardingScreen.dart';
import 'package:task_list_app/projects/lottieAnimations/lottieAnimations.dart';
import 'package:task_list_app/projects/onBoardingConcentric/pages/onboarding_page.dart';
import 'package:task_list_app/projects/runningApp/screens/splashScreen.dart' as RunningSplash;
import 'package:task_list_app/projects/taskListApp/splash/splashScreen.dart' as TaskSplash;
import 'package:task_list_app/projects/transitions/transitions.dart';
import 'package:task_list_app/projects/travelApp/pages/home_page.dart';
import 'package:task_list_app/projects/workOutApp/view/screens/dayListScreen.dart';

import 'main.dart';

class ProjectScreen extends StatefulWidget {
    ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null!;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.sp,
                  child: ElevatedButton(
                    onPressed: ()=> Navigator.push(context, CupertinoPageRoute(builder: (context) => DayListScreen())),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side:   BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('WorkOut App', style: TextStyle(fontSize: 14.sp)),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoardingScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side:   BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Gym App'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskSplash.SplashScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Task List App'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TravelHomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Travel App'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RunningSplash.SplashScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Running App'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeView()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Database App'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashCardScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('SlideCards'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TransitionsScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Transitions'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LottieAnimationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Lottie Animations'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChartScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Charts'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomChartScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('Custom Chart'),
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoardingConcentric()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                      side: BorderSide(width: 2, color: Colors.black), // outline border
                    ),
                    child: Text('OnBoarding Screens', style: TextStyle(fontSize: 14.sp)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
