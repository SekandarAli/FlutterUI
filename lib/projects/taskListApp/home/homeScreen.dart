// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/reusingWidgets/reusingWidgets.dart';
import 'package:task_list_app/styles/color.dart';

import '../task/taskScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedItem = 'Option 1';
  String? dropdownValue = "Today";

  String selectedOptions = 'All Tags';
  List<String> options = ['All Tags','Finance','Health','Business','Family','Store','Grocery','Entertainment','Food','Laundry'];

  @override
  Widget build(BuildContext context) {
    double w =  MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: ColorsTheme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsTheme.black,
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskScreen())),
        elevation: 0,
        child: Icon(Icons.add,color: ColorsTheme.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorsTheme.primaryColor,
                      backgroundImage: AssetImage("assets/images/person.jpg"),
                    ),
                    SizedBox(width: 15),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hi,',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color: Colors.black,),
                          ),
                          TextSpan(text: ' Tiana',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                        ],
                      ),
                    ),
                    Spacer(),
                    PopupMenuButton<String>(
                      offset: Offset(0, 35),
                      onSelected: (String value) {
                        setState(() {
                          _selectedItem = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Option 1',
                            child: Row(
                              mainAxisAlignment : MainAxisAlignment.spaceAround,
                              children: [
                                Text('Option 1'),
                                SizedBox(width: 10),
                                Icon(_selectedItem == 'Option 1' ? Icons.check_circle : Icons.check_circle_outline,color: ColorsTheme.black,),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Option 2',
                            child: Row(
                              mainAxisAlignment : MainAxisAlignment.spaceAround,
                              children: [
                                Text('Option 2'),
                                SizedBox(width: 10),
                                Icon(_selectedItem == 'Option 2' ? Icons.check_circle : Icons.check_circle_outline,color: ColorsTheme.black,),
                              ],
                            ),
                          ),
                        ];
                      },
                      child: Icon(Icons.more_vert_rounded,size: 30),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     children: [
                       WidgetsReUsing.containerStyle(
                         context: context,
                         height: 130,
                         containerColor: ColorsTheme.container1,
                         iconColor: Colors.deepPurple,
                         icon: Icons.sticky_note_2_rounded,
                         number: "8",
                         text: "Scheduled",
                       ),
                       SizedBox(height: 10),
                       WidgetsReUsing.containerStyle(
                         context: context,
                         height: 100,
                         containerColor: ColorsTheme.container3,
                         iconColor: Colors.orangeAccent,
                         icon: Icons.star_outlined,
                         number: "10",
                         text: "Important",
                       ),
                     ],
                   ),
                   Column(
                     children: [
                       WidgetsReUsing.containerStyle(
                         context: context,
                         height: 100,
                         containerColor: ColorsTheme.container2,
                         iconColor: Colors.pinkAccent,
                         icon: Icons.calendar_month_outlined,
                         number: "5",
                         text: "Today",
                       ),
                       SizedBox(height: 10),
                       WidgetsReUsing.containerStyle(
                         context: context,
                         height: 130,
                         containerColor: ColorsTheme.container4,
                         iconColor: Colors.blueGrey,
                         icon: Icons.folder_copy_rounded,
                         number: "23",
                         text: "All Tasks",
                       ),
                     ],
                   ),
                 ],
               ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tags",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(CupertinoIcons.chevron_down,color: ColorsTheme.grey,size: 15))
                  ],
                ),
                SizedBox(height: 10),
                /*Container(
                  color: ColorsTheme.transparent,
                  child: ChipsChoice<String>.single(
                    value: selectedOptions,
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
                    textDirection: TextDirection.ltr,
                  ),
                ),*/
                Container(
                  width: w,
                  color: Colors.transparent,
                  child: ChipsChoice<String>.single(
                    value: selectedOptions,
                    onChanged: (val) => setState(() => selectedOptions = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options,
                      value: (i, v) => v,
                      label: (i, v) => v,
                      style: (index, item) {
                        return C2ChipStyle.filled(
                          selectedStyle: C2ChipStyle(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.blueAccent,
                            foregroundStyle: TextStyle(color: Colors.white),
                          ),
                          foregroundStyle: TextStyle(color: Colors.grey.shade100),
                          color: Colors.grey.shade400,
                          // backgroundAlpha: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        );
                      },
                    ),
                    padding: EdgeInsets.zero,
                    wrapped: true,
                    textDirection: TextDirection.ltr,
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My list",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Add",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        WidgetsReUsing.listHomeStyle(
                            color: Colors.lightBlue,
                            icon: Icons.shopping_bag,
                            number: "41",
                            text: "Business",
                        ),
                        WidgetsReUsing.listHomeStyle(
                            color: Colors.redAccent,
                            icon: Icons.heart_broken,
                            number: "28",
                            text: "Health",
                        ),
                        WidgetsReUsing.listHomeStyle(
                            color: Colors.purpleAccent,
                            icon: Icons.videogame_asset_rounded,
                            number: "6",
                            text: "Entertainment",
                        ),
                        WidgetsReUsing.listHomeStyle(
                            color: Colors.yellow,
                            icon: Icons.home_filled,
                            number: "14",
                            text: "Home",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


