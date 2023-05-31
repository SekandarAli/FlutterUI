// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_list_app/styles/color.dart';

class CustomChart3Screen extends StatefulWidget {
  CustomChart3Screen({Key? key}) : super(key: key);

  @override
  _CustomChart3ScreenState createState() => _CustomChart3ScreenState();
}

class _CustomChart3ScreenState extends State<CustomChart3Screen> with TickerProviderStateMixin {

  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;
  bool showDot = false;
  late double dotX, dotY;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _slideAnimation =
        Tween<Offset>(begin: Offset(0, 100), end: Offset.zero).animate(
            CurvedAnimation(parent: _animationController!, curve: Curves.fastLinearToSlowEaseIn));
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<Data> dataSpline = [
      Data(monthName: 'Jan', revenue: "1", forcast: ""),
      Data(monthName: 'Feb', revenue: "7", forcast: ""),
      Data(monthName: 'Mar', revenue: "9", forcast: ""),
      Data(monthName: 'Apr', revenue: "17", forcast: ""),
      Data(monthName: 'May', revenue: "12", forcast: ""),
      Data(monthName: 'Jun', revenue: "20", forcast: ""),
      Data(monthName: 'Jul', revenue: "11", forcast: ""),
    ];

    Color colorBlue = Color(0xff2a52be);

    return Scaffold(
        backgroundColor: ColorsTheme.black,
        appBar: AppBar(
          title: const Text('Custom Chart 3'),
          foregroundColor: Colors.white,
          backgroundColor: colorBlue,
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(children: [

            SizedBox(height: 50),

            /// SECOND CHART

            SlideTransition(
              position: _slideAnimation!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                padding: EdgeInsets.all(10),
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  title: ChartTitle(
                      text: 'OVERVIEW',
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  primaryXAxis: CategoryAxis(

                    majorGridLines: const MajorGridLines(width: 1,dashArray: <double>[3,2],color: Colors.grey),

                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    axisLine: const AxisLine(width: 0,dashArray: <double>[5,2]),
                    // maximum: 7,
                    // crossesAt: 0,
                    labelAlignment: LabelAlignment.start,
                    majorTickLines: const MajorTickLines(size: 0,),
                  ),
                  primaryYAxis: NumericAxis(
                   isVisible: false
                  ),
                  series: <ChartSeries>[
                    SplineSeries<Data, String>(
                      dataSource: dataSpline,
                      color: colorBlue,
                      width: 3,
                      xValueMapper: (Data sales, _) => sales.monthName,
                      yValueMapper: (Data sales, _) => int.parse(sales.revenue),
                      name: 'DUMMY',
                      animationDelay: 800,
                        animationDuration: 2000,
                      markerSettings: MarkerSettings(isVisible: true,borderWidth: 1,borderColor: Colors.white,width: 12,height: 12,color: Colors.black,)
                    ),
                  ],
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              ),
            ),
          ]),
        ));
  }
}

class Data {
  Data({required this.monthName, required this.revenue, required this.forcast});

  final String monthName;
  final String revenue;
  final String forcast;
}
