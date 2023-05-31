// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';

class LottieAnimationScreen extends StatefulWidget {
  const LottieAnimationScreen({super.key});

  @override
  _LottieAnimationScreenState createState() => _LottieAnimationScreenState();
}

class _LottieAnimationScreenState extends State<LottieAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isPlaying = false;
  double _animationSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 5),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        if (_isPlaying) {
          _animationController.forward();
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      if (_isPlaying) {
        _animationController.stop();
      } else {
        _animationController.forward();
      }
      _isPlaying = !_isPlaying;
    });
  }

  void _changeAnimationSpeed(double speed) {
    setState(() {
      _animationSpeed = speed;
      _animationController.duration =
          Duration(milliseconds: (1000 / _animationSpeed).round());
      if (_isPlaying) {
        _animationController.repeat();
      }
    });
  }

  void _reverseAnimation() {
    setState(() {
      if (_animationController.isAnimating) {
        _animationController.stop(canceled: false);
      }
      _animationController.reset();
      _animationController.duration = const Duration(seconds: 5);
      _animationController.reverse(from: 1.0);
      _animationController.repeat();
    });
  }



  void _slowDownAnimation() {
    setState(() {
      if (_animationSpeed > 0.5) {
        _animationSpeed -= 0.5;
        _changeAnimationSpeed(_animationSpeed);
      }
    });
  }

  void _speedUpAnimation() {
    setState(() {
      if(_animationSpeed < 9.5) {
        _animationSpeed += 0.5;
        _changeAnimationSpeed(_animationSpeed);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Lottie.asset(
              Assets.lottieCar2,
              controller: _animationController,
              animate: true,
              repeat: true
            ),
            buttons(text: _animationController.isAnimating? "STOP" : "PLAY", onPress: _toggleAnimation),
            buttons(text: "SLOW", onPress: _slowDownAnimation),
            buttons(text: "FAST", onPress: _speedUpAnimation),
            buttons(text: "REVERSE", onPress: (){
              return _reverseAnimation();
            }),
            // buttons(text: "REVERSE", onPress: _reverseAnimation),
            SizedBox(height: 20),
            Slider(
              value: _animationSpeed,
              min: 0.01,
              max: 10.0,
              onChanged: _changeAnimationSpeed,
            ),

          ],
        ),
      ),
    );
  }

  Widget buttons({required String text, required Function() onPress}){
    return SizedBox(
      width: 160,
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
          side: BorderSide(width: 2, color: Colors.black), // outline border
        ),
        child: Text(text),
      ),
    );
  }
}




