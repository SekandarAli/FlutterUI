// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/color.dart';
import '../styles/text_styles.dart';

class WidgetsReUsing{
  static Widget containerStyle({
    required double height,
    required Color containerColor,
    required Color iconColor,
    required IconData icon,
    required String number,
    required String text,
    required BuildContext context,
  }){
    return Container(
      width :  MediaQuery.of(context).size.width * 0.44,
      height :  height,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorsTheme.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(icon,color: iconColor),
              ),
              Text(number,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black54),textAlign: TextAlign.end,)),
        ],
      ),
    );
  }


  static Widget listHomeStyle({
    required Color color,
    required IconData icon,
    required String number,
    required String text,
  }){
    return Container(
      padding: EdgeInsets.only(bottom: 10,top: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(icon,color: Colors.white),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
          ),
          Spacer(),
          Text(
            number,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: (){},
              icon: Icon(Icons.arrow_forward_ios_outlined,color: ColorsTheme.grey,size: 15))
        ],
      ),
    );
  }

  static Widget taskStyle({
    required IconData icon,
    required String textHead,
    required String textTrail,
    required Function() onPress,
  }){
    return Padding(
      padding: EdgeInsets.only(bottom: 10,top: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(icon,color: ColorsTheme.grey),
          ),
          SizedBox(width: 10),
          Text(
            textHead,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
          ),
          Spacer(),
          Text(
            textTrail,
            style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: (){
                onPress();
              },
              icon: Icon(CupertinoIcons.chevron_down,color: ColorsTheme.grey,size: 15))
        ],
      ),
    );
  }

  static Widget listStyle({
    required IconData icon,
    required String text,
    required Color color,
  }){
    return Padding(
      padding: EdgeInsets.only(bottom: 10,top: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(icon,color: Colors.white),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
          ),
          Spacer(),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.circle_outlined,color: ColorsTheme.grey))
        ],
      ),
    );
  }


  static Widget saveButton({
    required Function() onPress,
  }){
    return ElevatedButton(
      onPressed: (){
        onPress();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsTheme.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
      child: Text(
        "Confirm",textAlign: TextAlign.start,
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
      ),
    );
  }

  static Widget buttonStyle({required Function() onPress,required String text,required Color buttonColor,required Color textColor,}){
    return  ElevatedButton(
      onPressed: (){
        onPress();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(horizontal: 55,vertical: 23),
      ),
      child: Text(
        text,textAlign: TextAlign.start,
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: textColor),
      ),
    );
  }

  static buttonStyleWorkOut({
    required BuildContext context,
    required Function() onPress,
    required String text,
}){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: (){
          onPress();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsTheme.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.all(15),
        ),
        child:  Text(
          text,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
}

static buttonStyleWorkOut2({
    required BuildContext context,
    required Function() onPress,
    required String text,
    required IconData icon,
}){
    return GestureDetector(
      onTap: (){
        onPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon,color: ColorsTheme.pink,),
            Text(text,style: ThemeTexts.textStyleTitle3.copyWith(color: Colors.blueGrey),),
          ],
        )),
    );
}

  static buttonStyleRestScreen({
    required BuildContext context,
    required Function() onPress,
    required String text,
    required Color color,
    required Color bgColor,
  }){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 40,
      child: ElevatedButton(
        onPressed: (){
          onPress();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(5),
        ),
        child:  Text(
          text,
          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: color),
        ),
      ),
    );
  }

  static exitExerciseButtons({
    required BuildContext context,
    required Function() onPress,
    required String text,
    required Color bgColor,
    required Color textColor,
    required Border border,
  }){
    return GestureDetector(
      onTap: onPress,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: bgColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text,style: ThemeTexts.textStyleTitle3.copyWith(color: textColor),),
            ],
          )),
    );
  }
}