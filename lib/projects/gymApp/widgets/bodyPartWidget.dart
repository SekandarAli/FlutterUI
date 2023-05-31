// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BodyPartWidget extends StatefulWidget {
  const BodyPartWidget({super.key});

  @override
  _BodyPartWidgetState createState() => _BodyPartWidgetState();
}

class _BodyPartWidgetState extends State<BodyPartWidget> {

  bool absValue = false;
  bool shouldersValue = false;
  bool neckValue = false;
  bool handsValue = false;
  bool armsValue = false;
  bool chestValue = false;
  bool backValue = false;
  bool stomachValue = false;
  bool buttocksValue = false;
  bool legsValue = false;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Abs", value: absValue, color: Colors.blue.shade200,onTap: (){setState(()=> absValue = !absValue);}),
            containerButtonStyle(text: "Shoulder", value: shouldersValue, color: Colors.green.shade200,onTap: (){setState(()=> shouldersValue = !shouldersValue);}),
          ],
        ),
        SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Neck", value: neckValue, color: Colors.orange.shade200,onTap: (){setState(()=> neckValue = !neckValue);}),
            containerButtonStyle(text: "Hands", value: handsValue, color: Colors.pink.shade200,onTap: (){setState(()=> handsValue = !handsValue);}),
          ],
        ),
        SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Arms", value: armsValue, color: Colors.brown.shade200,onTap: (){setState(()=> armsValue = !armsValue);}),
            containerButtonStyle(text: "Chest", value: chestValue, color: Colors.yellow.shade200,onTap: (){setState(()=> chestValue = !chestValue);}),
          ],
        ),
        SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Back", value: backValue, color: Colors.purple.shade200,onTap: (){setState(()=> backValue = !backValue);}),
            containerButtonStyle(text: "Stomach", value: stomachValue, color: Colors.red.shade200,onTap: (){setState(()=> stomachValue = !stomachValue);}),
          ],
        ),
        SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Buttocks", value: buttocksValue, color: Colors.lightGreen.shade200,onTap: (){setState(()=> buttocksValue = !buttocksValue);}),
            containerButtonStyle(text: "Legs", value: legsValue, color: Colors.limeAccent.shade200,onTap: (){setState(()=> legsValue = !legsValue);}),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget containerButtonStyle({required String text,required bool value,required Color color,required Function() onTap,}){
    return GestureDetector(
      onTap: (){
       onTap();
      },
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width * 0.46,
        decoration: BoxDecoration(
          color: value == false ? Colors.grey.shade300 : color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),)),
      ),
    );
  }
  //
  // Widget rowContainerButtonStyle({required String textLeft,required String textRight,required bool value1,required bool value2}){
  //   return  Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           containerButtonStyle(text: textLeft,color: Colors.blue,value: value1),
  //           containerButtonStyle(text: textRight,color: Colors.green,value: value2),
  //         ],
  //       ),
  //       SizedBox(height: 5)
  //     ],
  //   );
  // }
}

