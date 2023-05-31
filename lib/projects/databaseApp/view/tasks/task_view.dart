// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import '../../../../projectScreen.dart';
import '../../../../styles/color.dart';
import '../../models/task.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';

class TaskView extends StatefulWidget {
  TaskView({
    Key? key,
    required this.taskControllerForTitle,
    required this.taskControllerForSubtitle,
    required this.task,
    required this.isImp,
  }) : super(key: key);

  TextEditingController? taskControllerForTitle;
  TextEditingController? taskControllerForSubtitle;
  final Task? task;
  final bool? isImp;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  String? title;
  String? subtitle;
  DateTime? time;
  DateTime? date;
  bool? isImportant = false;

  Box<Task>? taskBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBox = Hive.box<Task>("tasksBox");
    // isTaskImportant() ? isImportant = widget.task!.isImportant : isImportant;
  }


  /// Show Selected Time As String Format
  String showTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      } else {
        return DateFormat('hh:mm a').format(time).toString();
      }
    } else {
      return DateFormat('hh:mm a')
          .format(widget.task!.createdAtTime)
          .toString();
    }
  }

  /// Show Selected Time As DateTime Format
  DateTime showTimeAsDateTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateTime.now();
      } else {
        return time;
      }
    } else {
      return widget.task!.createdAtTime;
    }
  }

  /// Show Selected Date As String Format
  String showDate(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      } else {
        return DateFormat.yMMMEd().format(date).toString();
      }
    } else {
      return DateFormat.yMMMEd().format(widget.task!.createdAtDate).toString();
    }
  }

  // Show Selected Date As DateTime Format
  DateTime showDateAsDateTime(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateTime.now();
      } else {
        return date;
      }
    } else {
      return widget.task!.createdAtDate;
    }
  }

  //  bool isTaskImportant(bool? imp) {
  //   if (widget.task?.isImportant == null) {
  //     if (isImportant == false) {
  //       return false;
  //     } else {
  //       return true;
  //     }
  //   } else {
  //     return widget.task!.isImportant;
  //   }
  // }

  /// If any Task Already exist return TRUE otherWise FALSE
  bool isTaskAlreadyExistBool() {
    if (widget.taskControllerForTitle?.text == null &&
        widget.taskControllerForSubtitle?.text == null) {
      return true;
    } else {
      return false;
    }
  }

  /// If any task already exist app will update it otherwise the app will add a new task
  dynamic isTaskAlreadyExistUpdateTask() {
    if (widget.taskControllerForTitle?.text != null &&
        widget.taskControllerForSubtitle?.text != null) {
      try {

        /// if you want user to must update these field
        // widget.taskControllerForTitle?.text = title!;
        // widget.taskControllerForSubtitle?.text = subtitle!;
        // widget.task?.createdAtDate = date!;
        // widget.task?.createdAtTime = time!;

        widget.task!.isImportant = isImportant!;
        widget.task!.save();
        Navigator.of(context).pop();

      } catch (error) {
        nothingEnterOnUpdateTaskMode(context);
      }
    } else {
      if (title != null && subtitle != null) {
        Iterable values =  taskBox!.values.map((e) => e.subtitle.trim().toString());
        String subtitleString = subtitle.toString().trim();

        if (values.contains(subtitleString) || values.contains(subtitleString.toUpperCase()) || values.contains(subtitleString.toLowerCase())) {
          duplicateFieldsWarning(context);
        }

        else{
          var task = Task.create(
            title: title,
            createdAtTime: time,
            createdAtDate: date,
            subtitle: subtitle,
            isImportant: isImportant!
          );

          BaseWidget.of(context).dataStore.addTask(task: task);
          Navigator.of(context).pop();
        }
      }
      else {
        emptyFieldsWarning(context);
      }
    }
  }

  /// Delete Selected Task
  dynamic deleteTask() {
    return widget.task?.delete();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ColorsTheme.backgroundColor,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// new / update Task Text
                  _buildTopText(textTheme),

                  /// Middle Two TextFiled, Time And Date Selection Box
                  _buildMiddleTextFieldsANDTimeAndDateSelection(
                      context, textTheme),

                  /// All Bottom Buttons
                  _buildBottomButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// All Bottom Buttons
  Padding _buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: isTaskAlreadyExistBool()
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceAround,
        children: [
          isTaskAlreadyExistBool()
              ? Container()

              /// Delete Task Button
              :
          ElevatedButton(
            onPressed: (){
              deleteTask();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsTheme.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
            ),
            child:  Text(
              MyString.deleteTask,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),

          /// Add or Update Task Button
          ElevatedButton(
            onPressed: (){
              isTaskAlreadyExistUpdateTask();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsTheme.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
            ),
            child: Text(
              isTaskAlreadyExistBool()
                  ? "Add Task"
                  : "Update Task",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Middle Two TextFiled And Time And Date Selection Box
  SizedBox _buildMiddleTextFieldsANDTimeAndDateSelection(
      BuildContext context, TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 535,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title TextField

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: widget.taskControllerForSubtitle,
                cursorColor: Colors.blue,
                style: TextStyle(color: ColorsTheme.black,fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: ColorsTheme.grey,fontWeight: FontWeight.normal),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onFieldSubmitted: (value) {
                  subtitle  = value;
                },
                onChanged: (value) {
                  subtitle = value;
                },
              ),
            ),
          ),

          /// Description TextField

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 120,
              // width: double.infinity * 0.8,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: widget.taskControllerForTitle,
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
                onFieldSubmitted: (value) {
                  title = value;
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
          ),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// Time Picker
                  GestureDetector(
                    onTap: () {
                      DatePicker.showTimePicker(context,
                          showTitleActions: true,
                          showSecondsColumn: false,
                          onChanged: (_) {}, onConfirm: (selectedTime) {
                        setState(() {
                          if (widget.task?.createdAtTime == null) {
                            time = selectedTime;
                          } else {
                            widget.task!.createdAtTime = selectedTime;
                          }
                        });

                        FocusManager.instance.primaryFocus?.unfocus();
                      }, currentTime: showTimeAsDateTime(time));
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        children: [
                          Text(MyString.timeString, style: textTheme.titleMedium),
                          Expanded(child: Container()),
                          Container(
                            width: 80,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100),
                            child: Center(
                              child: Text(
                                showTime(time),
                                style: textTheme.titleSmall,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),


                  /// Date Picker
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2030, 3, 5),
                          onChanged: (_) {}, onConfirm: (selectedDate) {
                            setState(() {
                              if (widget.task?.createdAtDate == null) {
                                date = selectedDate;
                              } else {
                                widget.task!.createdAtDate = selectedDate;
                              }
                            });
                            FocusManager.instance.primaryFocus?.unfocus();
                          }, currentTime: showDateAsDateTime(date));
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        children: [
                          Text(MyString.dateString, style: textTheme.titleMedium),
                          Expanded(child: Container()),
                          Container(
                            width: 140,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100),
                            child: Center(
                              child: Text(
                                showDate(date),
                                style: textTheme.titleSmall,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  /// Mark as Important

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isImportant = !isImportant!;
                        // !isTaskImportant!(isImportant!) =! isTaskImportant(isImportant);
                        // if(widget.task == null){
                        //   isImportant =! isImportant;
                        // }
                        // else{
                        //   widget.task!.isImportant =! widget.task!.isImportant;
                        // }
                      });
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        children: [
                          Text(
                            "Mark as important",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                          ),
                          Spacer(),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey, width: 1)),
                            child: isImportant! ? Icon(Icons.check_circle,color: Colors.orangeAccent) : Icon(Icons.check, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Add Image
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

        ],
      ),
    );
  }

  /// new / update Task Text
  Row _buildTopText(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back,color: ColorsTheme.black,)),
        RichText(
          text: TextSpan(
              text: isTaskAlreadyExistBool()
                  ? MyString.addNewTask
                  : MyString.updateCurrentTask,
              style: textTheme.titleMedium,
              children: const [
                TextSpan(
                  text: MyString.taskString,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
        ),
        IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.close_rounded,color: ColorsTheme.black,)),
      ],
    );
  }
}
