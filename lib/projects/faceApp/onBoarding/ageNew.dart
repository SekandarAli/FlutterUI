// // ignore_for_file: prefer_const_constructors
//
// import 'package:flame/components.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_list_app/generated/assets.dart';
// import 'package:task_list_app/projects/faceApp/onBoarding/chips.dart';
// import 'package:task_list_app/projects/faceApp/onBoarding/planGeneration.dart';
//
// class AgeNew extends StatelessWidget {
//   const AgeNew({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               Assets.imagesOne,
//               fit: BoxFit.contain,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             left: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(30),
//                   topLeft: Radius.circular(30),
//                 ),
//               ),
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Text(
//                     "Select your Age",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "To the oral initrd blog in island of the works dto the thing Beautiful",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                   ),
//                   Spacer(),
//                   HorizontalSlider(),
//                   Spacer(),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 15),
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: SizedBox(
//                         width: 60,
//                         height: 60,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Get.to(()=> Chips());
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.cyan,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                           ),
//                           child: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 30,
//             right: 10,
//             left: 10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(
//                   Assets.imagesInstagram,
//                   width: 30,
//                   height: 30,
//                 ),
//                 Text("skip"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class HorizontalSlider extends StatefulWidget {
//   const HorizontalSlider({Key? key}) : super(key: key);
//
//   @override
//   _HorizontalSliderState createState() => _HorizontalSliderState();
// }
//
// class _HorizontalSliderState extends State<HorizontalSlider> {
//   final ScrollController _scrollController = ScrollController();
//   int _startIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _onScroll() {
//     setState(() {
//       _startIndex = (_scrollController.offset ~/ 50) - 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<int> items = List<int>.generate(101, (index) => index + 10);
//
//     return SizedBox(
//       height: 150,
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               height: 100,
//               width: 100,
//               color: Colors.orange,
//             ),
//           ),
//           ListView.builder(
//             scrollDirection: Axis.horizontal,
//             controller: _scrollController,
//             itemCount: items.length,
//             itemBuilder: (BuildContext context, int index) {
//               final int endIndex = _startIndex + 2;
//
//               return AnimatedContainer(
//                 duration: Duration(milliseconds: 500),
//                 alignment: Alignment(
//                   (_startIndex <= index && index <= endIndex) ? 0 : 0.5,
//                   0,
//                 ),
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _scrollController.animateTo(
//                         index * 50.0,
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.easeInOut,
//                       );
//                     });
//                   },
//                   child: Container(
//                     width: 150,
//                     height: 150,
//                     child: Center(
//                       child: Text(
//                         items[index].toString(),
//                         style: TextStyle(
//                           fontSize: (_startIndex <= index && index <= endIndex) ? 50 : 40,
//                           fontWeight: FontWeight.bold,
//                           color: (_startIndex <= index && index <= endIndex)
//                               ? Colors.black
//                               : Colors.cyan.shade100,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
