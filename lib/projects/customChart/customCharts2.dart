// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_list_app/projects/customChart/customCharts3.dart';
import 'package:task_list_app/styles/color.dart';

class CustomChart2Screen extends StatefulWidget {
  CustomChart2Screen({Key? key}) : super(key: key);

  @override
  _CustomChart2ScreenState createState() => _CustomChart2ScreenState();
}

class _CustomChart2ScreenState extends State<CustomChart2Screen> with TickerProviderStateMixin {

  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _slideAnimation =
        Tween<Offset>(begin: Offset(-100, 0), end: Offset.zero).animate(
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
      Data(monthName: 'Jan', revenue: "11", forcast: "10"),
      Data(monthName: 'Feb', revenue: "10", forcast: "9"),
      Data(monthName: 'Mar', revenue: "9", forcast: "9"),
      Data(monthName: 'Apr', revenue: "10", forcast: "9"),
      Data(monthName: 'May', revenue: "11", forcast: "10"),
      Data(monthName: 'Jun', revenue: "12", forcast: "9"),
      Data(monthName: 'Jul', revenue: "11", forcast: "10"),
      Data(monthName: 'Aug', revenue: "10", forcast: "11"),
      Data(monthName: 'Sep', revenue: "9", forcast: "10"),
      Data(monthName: 'Oct', revenue: "10", forcast: "9"),
      Data(monthName: 'Nov', revenue: "11", forcast: "10"),
      Data(monthName: 'Dec', revenue: "10", forcast: "11"),
    ];

    Color colorBlue = Color(0xff6fc7f7);
    Color colorRed = Color(0xffed6b3c);

    return Scaffold(
        backgroundColor: ColorsTheme.backgroundColor,
        appBar: AppBar(
          title: const Text('Custom Chart 2'),
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
              child: Column(
                children: [
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            title: ChartTitle(
                                text: 'BALANCE OVERVIEW',
                                textStyle: TextStyle(
                                    color: colorBlue, fontWeight: FontWeight.bold)),
                            primaryXAxis: CategoryAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              numberFormat: NumberFormat('\$#K'),
                              interval: 4,
                              axisLine: const AxisLine(width: 0),
                              majorTickLines: const MajorTickLines(size: 0),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            series: <ChartSeries>[
                              SplineSeries<Data, String>(
                                dataSource: dataSpline,
                                color: colorBlue,
                                xValueMapper: (Data sales, _) => sales.monthName,
                                yValueMapper: (Data sales, _) =>
                                    int.parse(sales.revenue),
                                name: 'Revenue',
                                animationDelay: 800,
                                animationDuration: 2000,
                              ),
                              SplineSeries<Data, String>(
                                dataSource: dataSpline,
                                color: colorRed,
                                xValueMapper: (Data sales, _) => sales.monthName,
                                yValueMapper: (Data sales, _) =>
                                    int.parse(sales.forcast),
                                name: 'Expenses',
                                animationDelay: 800,
                                animationDuration: 2000,
                              ),
                            ],
                            tooltipBehavior: TooltipBehavior(enable: true),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: colorBlue,
                              ),
                              SizedBox(width: 5),
                              Text("Revenue"),
                              SizedBox(width: 20),
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: colorRed,
                              ),
                              SizedBox(width: 5),
                              Text("Expenses"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomChart3Screen()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                        side:   BorderSide(width: 2, color: Colors.black), // outline border
                      ),
                      child: Text('Next'),
                    ),
                  ),
                ],
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
