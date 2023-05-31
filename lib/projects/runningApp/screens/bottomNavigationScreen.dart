// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers, library_private_types_in_public_api, null_check_always_fails, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/projects/runningApp/screens/challenge/challengeScreen.dart';
import 'package:task_list_app/projects/runningApp/screens/home/homeScreen.dart';
import 'package:task_list_app/projects/runningApp/screens/run/runScreen.dart';
import '../../../styles/color.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> with TickerProviderStateMixin{

  int bottomTabIndex = 1;
  late TabController bottomTabController = TabController(length: 4, vsync: this,initialIndex: 1);

  @override
  void initState() {
    super.initState();
    bottomTabController.addListener(() {
      if (bottomTabController.index == 0) {
        setState(() {
          bottomTabIndex = 0;
          bottomTabController.index = bottomTabIndex;
          bottomTabController.animateTo(0,duration: Duration(milliseconds: 1));
        });
      }
      else if (bottomTabController.index == 1) {
        setState(() {
          bottomTabIndex = 1;
          bottomTabController.index = bottomTabIndex;
          bottomTabController.animateTo(1,duration: Duration(milliseconds: 100),curve: Curves.fastLinearToSlowEaseIn);
        });
      }
      else if (bottomTabController.index == 2) {
        setState(() {
          bottomTabIndex = 2;
          bottomTabController.index = bottomTabIndex;
          bottomTabController.animateTo(2,duration: Duration(milliseconds: 1));
        });
      }
      else if (bottomTabController.index == 3) {
        setState(() {
          bottomTabIndex = 3;
          bottomTabController.index = bottomTabIndex;
          bottomTabController.animateTo(3,duration: Duration(milliseconds: 1));
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: Colors.grey,
          ),
          BottomAppBar(
              color: ColorsTheme.white,
              clipBehavior: Clip.none,
              child: Container(
                color: ColorsTheme.white,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    bottomWidget(
                        title: "Home",
                        icon1: Icons.home_filled,
                        index: 0,
                        onTap: (){
                          bottomTabIndex = 0;
                          bottomTabController.index = bottomTabIndex;

                        }
                    ),
                    bottomWidget(
                        title: "Run",
                        icon1: Icons.directions_run,
                        index: 1,
                        onTap: (){
                          bottomTabIndex = 1;
                          bottomTabController.index = bottomTabIndex;
                        }
                    ),
                    bottomWidget(
                        title: "Challenge",
                        icon1: Icons.wine_bar_sharp,
                        index: 2,
                        onTap: (){
                          bottomTabIndex = 2;
                          bottomTabController.index = bottomTabIndex;
                        }
                    ),
                    bottomWidget(
                        title: "More",
                        icon1: CupertinoIcons.table_badge_more_fill,
                        index: 3,
                        onTap: (){
                          bottomTabIndex = 3;
                          bottomTabController.index = bottomTabIndex;
                        }
                    ),
                  ],
                ),
              )),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: bottomTabController,
                  children: [
                    HomeScreen(),
                    RunScreen(),
                    ChallengeScreen(),
                    HomeScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget({
    required int index,
    required String title,
    required IconData icon1,
    required Function() onTap
  }) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon1,
              color: bottomTabIndex == index ? ColorsTheme.white : Colors.grey.shade800,
            ),
            Text(
                title,
                style: TextStyle(
                  fontSize: 8,
                  color: bottomTabIndex == index
                      ? ColorsTheme.white
                      : Colors.grey.shade800,
                )
            )
          ],
        ),
      ),
    );
  }
}