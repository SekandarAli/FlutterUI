// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/reusingWidgets/reusingWidgets.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/projects/gymApp/home/homeScreen.dart';
import 'package:task_list_app/projects/gymApp/widgets/foodWidget.dart';

import '../widgets/bodyPartWidget.dart';
import '../widgets/weightWidget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  int timeDuration = 10;
  Curve curveTransition = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      OnBoardingPages(
        title: 'You are\nready to go!',
        subtitle: '3,000+ classes across categories like\nrunning, yoga and strength training.',
        widget: Lottie.asset(Assets.lottieOnBoard),
      ),
      OnBoardingPages(
        title: 'How much\nyour weight?',
        subtitle: 'This is just to set the\nrecommendation for you to find out.',
        widget: WeightWidget(),
      ),
      OnBoardingPages(
        title: 'What do you want\nto work on?',
        subtitle: 'Its time to choose what part of body\nyou wants to improve.',
        widget: BodyPartWidget(),
      ),
      OnBoardingPages(
        title: 'What do you like\nthe most?',
        subtitle: 'Its used in getting to the\nyou proteins in it.',
        widget: FoodWidget(),
      ),
    ];
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        return null!;
      },
      child: Scaffold(
        backgroundColor: ColorsTheme.white,
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return pages[index];
                },
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                      child: ListView.builder(
                        itemCount: pages.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: timeDuration),
                              width: _currentPage == index ? 20 : 8,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? ColorsTheme.black
                                    : Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: timeDuration),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: _currentPage == 0 ?
                      WidgetsReUsing.buttonStyle(
                        onPress: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: timeDuration),
                              curve: curveTransition);
                          },
                        text: 'Next',
                        buttonColor: ColorsTheme.black,
                        textColor: ColorsTheme.white,
                      )
                          : _currentPage == pages.length - 1 ?
                      WidgetsReUsing.buttonStyle(
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        },
                        text: 'Start',
                        buttonColor: ColorsTheme.black,
                        textColor: ColorsTheme.white,
                      ) :
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          WidgetsReUsing.buttonStyle(
                            onPress: () {
                              _controller.previousPage(
                                  duration: Duration(milliseconds: timeDuration),
                                  curve: curveTransition);
                              },
                            text: 'Back',
                            buttonColor: ColorsTheme.white,
                            textColor: ColorsTheme.grey,
                          ),
                          WidgetsReUsing.buttonStyle(
                            onPress: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: timeDuration),
                                  curve: curveTransition);
                              },
                            text: 'Next',
                            buttonColor: ColorsTheme.black,
                            textColor: ColorsTheme.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingPages extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget widget;

  const OnBoardingPages({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          widget,
          SizedBox(height: 20),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: ColorsTheme.grey,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


