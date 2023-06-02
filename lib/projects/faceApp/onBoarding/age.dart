// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/projects/faceApp/onBoarding/chips.dart';
import 'package:task_list_app/styles/color.dart';
import 'package:task_list_app/styles/text_styles.dart';

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesOne,
            fit: BoxFit.contain,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 0.5.sh,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  Text(
                    "Select your Age",
                    textAlign: TextAlign.center,
                    style: ThemeTexts.textStyleTitle1.copyWith(
                      color: ColorsTheme.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    "To the oral initrd blog in  island of the works dto the thing Beautiful",
                    textAlign: TextAlign.center,
                    style: ThemeTexts.textStyleTitle1.copyWith(
                      color: ColorsTheme.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Spacer(),
                  HorizontalSlider(),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.sp),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 60.sp,
                        height: 60.sp,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(
                                  () => Chips(),
                              transition: Transition.cupertinoDialog,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30.sp,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Assets.imagesInstagram,
                  width: 30.sp,
                  height: 30.sp,
                ),
                Text("skip"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalSlider extends StatefulWidget {
  const HorizontalSlider({super.key});

  @override
  _HorizontalSliderState createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _selectedIndex = ((_scrollController.offset + 75.w) / 150.w).round();
      print(_selectedIndex + 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items =
    List<String>.generate(91, (index) => (index + 10).toString());

    return SizedBox(
      height: 150.sp,
      child: ListViewBuilderWidget(
        scrollController: _scrollController,
        selectedIndex: _selectedIndex,
        items: items,
      ),
    );
  }
}

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({
    Key? key,
    required this.scrollController,
    required this.selectedIndex,
    required this.items,
  }) : super(key: key);

  final ScrollController scrollController;
  final int selectedIndex;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 150.sp,
          height: 150.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120.sp,
                height: 120.sp,
                decoration: BoxDecoration(
                  color: selectedIndex == index ? Colors.cyan : null,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      fontSize: selectedIndex == index ? 50.sp : 40.sp,
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == index
                          ? Colors.white
                          : Colors.cyan.shade100,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}



