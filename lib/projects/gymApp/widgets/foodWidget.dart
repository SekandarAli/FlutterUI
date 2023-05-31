// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget({super.key});

  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {

  bool proteinValue = false;
  bool carbsValue = false;
  bool fishValue = false;
  bool diaryValue = false;
  bool fruitsValue = false;
  bool vegetablesValue = false;
  bool organicValue = false;
  bool coffeeValue = false;
  bool vegansValue = false;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Protein", icon: Icons.adb_rounded, value: proteinValue, color: Colors.blue.shade200, onTap: () {setState(() => proteinValue = !proteinValue);}),
            containerButtonStyle(text: "Carbs", icon: Icons.card_giftcard_rounded, value: carbsValue, color: Colors.green.shade200, onTap: () {setState(() => carbsValue = !carbsValue);}),
            containerButtonStyle(text: "Fish", icon: Icons.fire_hydrant_alt_rounded, value: fishValue, color: Colors.orange.shade200, onTap: () {setState(() => fishValue = !fishValue);}),
          ],
        ),
        SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Dairy", icon: Icons.directions_railway_filled_rounded, value: diaryValue, color: Colors.purple.shade200, onTap: () {setState(() => diaryValue = !diaryValue);}),
            containerButtonStyle(text: "Fruits", icon: Icons.apple, value: fruitsValue, color: Colors.brown.shade200, onTap: () {setState(() => fruitsValue = !fruitsValue);}),
            containerButtonStyle(text: "Vegetables", icon: Icons.local_pizza_rounded, value: vegetablesValue, color: Colors.yellow.shade200, onTap: () {setState(() => vegetablesValue = !vegetablesValue);}),
          ],
        ),
        SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerButtonStyle(text: "Organic", icon: Icons.offline_bolt_rounded, value: organicValue, color: Colors.red.shade200, onTap: () {setState(() => organicValue = !organicValue);}),
            containerButtonStyle(text: "Coffee", icon: Icons.coffee_maker_rounded, value: coffeeValue, color: Colors.lightGreen.shade200, onTap: () {setState(() => coffeeValue = !coffeeValue);}),
            containerButtonStyle(text: "Vegan", icon: Icons.vertical_shades_rounded, value: vegansValue, color: Colors.pink.shade200, onTap: () {setState(() => vegansValue = !vegansValue);}),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget containerButtonStyle(
      {required String text, required bool value, required Color color, required Function() onTap, required IconData icon,}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(0),
        height: 100,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color: value == false ? Colors.grey.shade300 : color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,color: value == false ? Colors.grey : Colors.black),
            Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
          ],
        ),
      ),
    );
  }
}

