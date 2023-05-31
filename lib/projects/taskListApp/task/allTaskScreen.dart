// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/styles/color.dart';

class AllTaskScreen extends StatefulWidget {
  const AllTaskScreen({Key? key}) : super(key: key);

  @override
  State<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends State<AllTaskScreen> {

  var selectedIndex;

  @override
  Widget build(BuildContext context) {
    double w =  MediaQuery.of(context).size.width;
    // double h =  MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsTheme.backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded,color: ColorsTheme.black,)),
                  Text('All Task',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(CupertinoIcons.arrow_up_arrow_down,color: ColorsTheme.black,)),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                width: w,
                child: Text(
                  "Business",textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return IntrinsicHeight(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: w,
                        // height: h,
                        color: ColorsTheme.transparent,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.circle_outlined,color: ColorsTheme.grey,),
                                SizedBox(height: 5),
                                SizedBox(
                                    height: 120,
                                    child: VerticalDivider(
                                      thickness: 2,color: ColorsTheme.grey,
                                    ))
                              ],
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                width: w,
                                decoration: BoxDecoration(
                                  color: ColorsTheme.white,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), topRight: Radius.circular(50)),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Partner meeting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                                              Text(DateFormat('MMM d, y').format(DateTime.now()),style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black54),),
                                              SizedBox(height: 10),
                                              Text('Prepare all documents of the \nsign process send them.',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.grey),),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue.shade100,
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    ),
                                                    child: Text('#work',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.blueGrey),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue.shade100,
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    ),
                                                    child: Text('#documents',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.blueGrey),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                      right: 15,
                                      top: 15,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade100,
                                          borderRadius: BorderRadius.all(Radius.circular(50)),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Icon(Icons.star,color: Colors.orangeAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
