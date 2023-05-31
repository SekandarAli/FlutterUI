                                /// Exercise Screen Timer ///


// // ignore_for_file: prefer_const_constructors
//
// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:task_list_app/projects/workOutApp/view/screens/restScreen.dart';
// import 'package:task_list_app/reusingWidgets/reusingWidgets.dart';
// import 'package:task_list_app/styles/color.dart';
// import '../../../../generated/assets.dart';
// import '../../../../styles/text_styles.dart';
//
// class ExerciseScreenTimer extends StatefulWidget {
//   const ExerciseScreenTimer({Key? key}) : super(key: key);
//
//   @override
//   State<ExerciseScreenTimer> createState() => _ExerciseScreenTimerState();
// }
//
// class _ExerciseScreenTimerState extends State<ExerciseScreenTimer> with TickerProviderStateMixin{
//
//   int remainingSeconds = 30;
//   Timer? timer;
//   bool isPaused = false;
//   AnimationController? _controller;
//
//   AudioPlayer audioPlayer = AudioPlayer();
//   @override
//   void initState() {
//     super.initState();
//     audioPlayer.play(AssetSource("audio/hold_your_breath.mp3"));
//     _controller = AnimationController(vsync: this);
//     startTimer();
//   }
//
//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       if ( isPaused) {
//         timer?.cancel();
//       }
//       else if (remainingSeconds <= 0 ) {
//         timer?.cancel();
//         navigateToNewScreen();
//       } else {
//         setState(() {
//           remainingSeconds--;
//         });
//       }
//     });
//   }
//
//   void pauseTimer() {
//     setState(() {
//       isPaused = true;
//     });
//   }
//
//   void resumeTimer() {
//     setState(() {
//       isPaused = false;
//       startTimer();
//     });
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     if (mounted) {
//       _controller?.dispose();
//     }
//     super.dispose();
//   }
//
//   void toggleTimer() {
//     if (isPaused) {
//       resumeTimer();
//       _controller?.repeat();
//     } else {
//       pauseTimer();
//       _controller?.stop();
//     }
//   }
//
//   void navigateToNewScreen() => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => RestScreen()));
//
//   @override
//   Widget build(BuildContext context) {
//     String formattedTime = remainingSeconds.toString().padLeft(2, '0');
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                       onPressed: (){
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(CupertinoIcons.arrow_left_circle,color: ColorsTheme.black,size: 30,)),
//                   Text('Exercise',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
//                   SizedBox(width: 20),
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 child: LottieBuilder.asset(
//                   Assets.lottieJumpingJack,
//                   controller: _controller,
//                   onLoaded: (composition) {
//                     if (_controller != null) {
//                       _controller!.duration = composition.duration;
//                       _controller!.repeat();
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text("Jumping Jacks\n",style: ThemeTexts.textStyleTitle1.copyWith(color: ColorsTheme.black),),
//               Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       '00:$formattedTime',
//                       style: TextStyle(fontSize: 24),
//                     ),
//                     SizedBox(height: 20),
//                     SizedBox(
//                       width: 100,
//                       height: 100,
//                       child: ElevatedButton(
//                         onPressed: toggleTimer,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.pink.shade100,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           padding: EdgeInsets.all(15),
//                         ),
//                         child: Icon(
//                           isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
//                           size: 50,
//                           color: ColorsTheme.pink,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   WidgetsReUsing.buttonStyleWorkOut2(
//                     onPress: (){},
//                     icon: Icons.skip_previous_rounded,
//                     text: "Previous", context: context,),
//                   WidgetsReUsing.buttonStyleWorkOut2(
//                     onPress: navigateToNewScreen,
//                     icon: Icons.skip_next_rounded,
//                     text: "Skip", context: context,),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//

                                /// Exercise Screen Timer ///
