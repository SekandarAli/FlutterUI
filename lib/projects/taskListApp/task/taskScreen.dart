// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/styles/color.dart';

import '../../../reusingWidgets/reusingWidgets.dart';
import 'allTaskScreen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime? _selectedDate;
  DateTime? _selectedTime;

  var _selected;
  final List<String> _options = ['Never','Hourly','By Days','Weekdays','Weekends','Weekly', 'Monthly', 'Annually'];

  List<String>? selectedOptions = [];
  List<String> options = ['All Tags','Finance','Health','Food','Business','Family','Store','Grocery','Entertainment','Laundry'];

  bool isTagClose = true;

  @override
  Widget build(BuildContext context) {
    double w =  MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsTheme.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
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
                    Text('New Task',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.close_rounded,color: ColorsTheme.black,)),
                  ],
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      cursorColor: Colors.blue,
                      style: TextStyle(color: ColorsTheme.black,fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: ColorsTheme.grey,fontWeight: FontWeight.normal),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 120,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      cursorColor: Colors.blue,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: ColorsTheme.grey),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        WidgetsReUsing.taskStyle(
                          icon: CupertinoIcons.calendar_circle_fill,
                          textHead: "Date",
                          textTrail: _selectedDate != null ? DateFormat('MMM d, y').format(_selectedDate!) : "",
                          onPress: (){
                            _showDatePicker(context);
                          }
                        ),
                        WidgetsReUsing.taskStyle(
                          icon: CupertinoIcons.time_solid,
                          textHead: "Time",
                            textTrail: _selectedTime != null ? DateFormat('hh:mm aaa').format(_selectedTime!) : "",
                            onPress: (){
                            _showTimePicker(context);
                          }
                        ),
                        WidgetsReUsing.taskStyle(
                          icon: Icons.change_circle,
                          textHead: "Repeat",
                          textTrail: "",
                          onPress: (){
                            _showRepeatPicker(context);
                          }
                        ),
                        WidgetsReUsing.taskStyle(
                          icon: Icons.tag_rounded,
                          textHead: "Tags",
                          textTrail: "",
                          onPress: (){
                            setState(() {
                              isTagClose = !isTagClose;
                            });
                          }
                        ),
                        SizedBox(height: 10),
                        isTagClose == true ? Column(
                          children: [
                            Container(
                              width: w,
                              color: ColorsTheme.transparent,
                              child: ChipsChoice<String>.multiple(
                                value: selectedOptions!,
                                onChanged: (val) => setState(() => selectedOptions = val),
                                choiceItems: C2Choice.listFrom<String, String>(
                                  source: options,
                                  value: (i, v) => v,
                                  label: (i, v) => v,
                                ),
                                padding: EdgeInsets.zero,
                                choiceStyle: C2ChipStyle.filled(
                                  padding: EdgeInsets.all(5),
                                  selectedStyle: C2ChipStyle(
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blueAccent
                                  ),
                                ),
                                wrapped: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              cursorColor: Colors.blue,
                              style: TextStyle(color: ColorsTheme.black,fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Add new tag...',
                                hintStyle: TextStyle(color: ColorsTheme.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:  ColorsTheme.lightGrey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorsTheme.lightGrey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            )
                          ],
                        ) : Container(),
                        // SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10,top: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.star,color: Colors.orangeAccent),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Mark as important",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.circle_outlined,color: ColorsTheme.grey,))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.add,color: ColorsTheme.blue,size: 30)),
                        Text(
                          "Add Image",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ColorsTheme.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  width: w,
                  child: Text(
                    "My list",textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 0),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        WidgetsReUsing.listStyle(
                          icon: Icons.shopping_bag,
                          text: "Business",
                          color: Colors.lightBlue
                        ),
                        WidgetsReUsing.listStyle(
                            icon: Icons.heart_broken,
                            text: "Health",
                            color: Colors.redAccent

                        ),
                        WidgetsReUsing.listStyle(
                            icon: Icons.videogame_asset_rounded,
                            text: "Entertainment",
                            color: Colors.purpleAccent
                        ),
                        WidgetsReUsing.listStyle(
                            icon: Icons.home_filled,
                            text: "Home",
                            color: Colors.yellow
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AllTaskScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsTheme.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 55,vertical: 23),
                  ),
                  child: Text(
                    "Save",textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTimePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  backgroundColor: ColorsTheme.white,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime time) {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                ),
              ),
              WidgetsReUsing.saveButton(onPress: (){
                // setState(() {
                  Navigator.pop(context);
                // });
              }),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  void _showRepeatPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Material(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _options.length,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        title: Text(_options[index]),
                        value: _options[index],
                        groupValue: _selected,
                        onChanged: (value) {
                          setState(() {
                            _selected = value;
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                WidgetsReUsing.saveButton(onPress: (){
                  // setState(() {
                  Navigator.pop(context);
                  // });
                }),
                SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
