// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_list_app/projects/faceApp/onBoarding/transition.dart';
import 'controller/active_app_controller.dart';
import 'projectScreen.dart';
import 'dart:async';
import 'package:hive_flutter/adapters.dart';
import 'projects/databaseApp/models/task.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await Hive.initFlutter();

  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.openBox<Task>("tasksBox");

  runApp(BaseWidget(child: const MyApp()));
  // runApp(WorkoutPlanApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final ActiveAppController _activeAppController = Get.put(ActiveAppController());

  getActiveApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? statusValue = prefs.getInt('statusValue');
    if (statusValue != null) {
      _activeAppController.changeActiveApp(statusValue);
    }
    else {
      _activeAppController.changeActiveApp(1);
    }
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            title: 'Task List App',
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            // home: Scaffold(body: Center(child: CustomCardSwiper()))
            // home: ProjectScreen()
            home: child
          // home: CardSlider()
        );
      },
      // child: ProjectScreen(),
      child: MyCustomWidget(),
    );
  }
}



