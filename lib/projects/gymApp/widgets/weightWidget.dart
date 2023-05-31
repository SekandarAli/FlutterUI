// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_list_app/styles/color.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({super.key});

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  double _currentWeight = 30;

  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              value = !value;
            });
          },
          child:
          Container(
            width: 180,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: value == true ?
            Row(
              children: [
                Container(
                  width: 90,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Center(child: Text("kg",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16),)),
                ),
                SizedBox(width: 30),
                Center(child: Text("lb",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 16),))
              ],
            ) :
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: Text("kg",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 16),)),
                SizedBox(width: 30),
                Container(
                  width: 90,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Center(child: Text("lb",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16),)),
                ),
              ],
            ),
          )
        ),
        SizedBox(height: 20),
        Card(
          elevation: 0,
          color: ColorsTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        _currentWeight.toInt().toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    value == true ? 'kg' : 'lb',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value == true ? 91 : 171,
                  itemExtent: 50,
                  itemBuilder: (BuildContext context, int index) {
                    index = index + 30;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentWeight = index.toDouble();
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 5,
                            decoration: BoxDecoration(
                              color: _currentWeight == index.toDouble()
                                  ? Colors.black
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Text(
                            index.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _currentWeight == index.toDouble()
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

