// ignore_for_file: prefer_const_constructors

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../cardSlider/themes/constants.dart';

class TransitionsScreen extends StatefulWidget {
  const TransitionsScreen({Key? key}) : super(key: key);

  @override
  State<TransitionsScreen> createState() => _TransitionsScreenState();
}
class _TransitionsScreenState extends State<TransitionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             buttons(text: "Fade",onPress: (){
               Navigator.push(context,
                 PageRouteBuilder(
                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
                     return FadeTransition(opacity: animation, child: child);
                   },
                   pageBuilder: (context, animation, secondaryAnimation) {
                     return NextScreen();
                   },
                 ),
               );
             }),

              buttons(text: "Slide",onPress: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NextScreen();
                    },
                  ),
                );
              }),

              buttons(text: "Scale ",onPress: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NextScreen();
                    },
                  ),
                );
              }),

              buttons(text: "Size",onPress: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SizeTransition(
                        sizeFactor: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NextScreen();
                    },
                  ),
                );
              }),

              buttons(text: "Rotation",onPress: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return RotationTransition(
                        turns: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NextScreen();
                    },
                  ),
                );
              }),

              buttons(text: "SharedAxis",onPress: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.scaled,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NextScreen();
                    },
                  ),
                );
              }),

              buttons(text: "Cupertino",onPress: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => NextScreen(),
                  ),
                );
              }),

              buttons(text: "Custom",onPress: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return RotationTransition(
                        turns: animation,

                        child: ScaleTransition(
                          scale: animation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NextScreen();
                    },
                  ),
                );
              }),

              buttons(text: "Page Builder",onPress: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NextScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return _buildCustomTransition(animation, child);
                    },
                  ),
                );
              }),

              buttons(text: "Top-Bottom",onPress: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: NextScreen()));
              }),

              buttons(text: "Bottom-Top",onPress: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: NextScreen()));
              }),

              buttons(text: "Left-Right",onPress: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: NextScreen()));
              }),

              buttons(text: "Right-Left",onPress: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: NextScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTransition(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }
}
  
  Widget buttons({required String text, required Function() onPress}){
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
          side: BorderSide(width: 2, color: Colors.black), // outline border
        ),
        child: Text("$text Transition"),
      ),
    );
}


class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.purple,
                  Colors.blue.shade900,
                  Colors.blue,
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/images/others/Signal.png',
          ),
          Align(
            child: Image.asset(
              'assets/images/others/Starts.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                  side: BorderSide(width: 2, color: Colors.black), // outline border
                ),
                child: Text('BACK'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


