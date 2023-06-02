// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_list_app/projects/customChart/customCharts2.dart';
import 'package:task_list_app/styles/color.dart';

class CustomChart5Screen extends StatefulWidget {
  CustomChart5Screen({Key? key}) : super(key: key);

  @override
  _CustomChart5ScreenState createState() => _CustomChart5ScreenState();
}

class _CustomChart5ScreenState extends State<CustomChart5Screen> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Data> data = [
    Data(monthName: '2', revenue: "1",),
    Data(monthName: '3', revenue: "2",),
    Data(monthName: '4', revenue: "3",),
    Data(monthName: '5', revenue: "4",),
    Data(monthName: '6', revenue: "5",),
    Data(monthName: '7', revenue: "6",),
    Data(monthName: '8', revenue: "8",),
    Data(monthName: '9', revenue: "9",),
    Data(monthName: '10', revenue: "10",),
    ];

    double width = 0.7;
    double spacing = 0.1;
    Color colorGreen = Color(0xff0ebe00);

    return Scaffold(
        backgroundColor: ColorsTheme.backgroundColor,
        appBar: AppBar(
          title: const Text('Custom Chart'),
          foregroundColor: Colors.white,
          backgroundColor: colorGreen,
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(children: [
            SizedBox(height: 50),
            charts(
                widget1: FadeTransition(
                  opacity: _animation,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    title: ChartTitle(
                        text: 'SALES FORCAST',
                        textStyle: TextStyle(
                            color: colorGreen, fontWeight: FontWeight.bold)),
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLine: const AxisLine(width: 0),
                      borderWidth: 0,
                      majorTickLines: MajorTickLines(width: 0),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      numberFormat: NumberFormat(''),
                      interval: 4,
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(size: 0),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    series: [
                      ColumnSeries<Data, String>(
                        width: width,
                        spacing: spacing,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
                        dataSource: data,
                        color: colorGreen,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.green.shade700,
                            Colors.green.shade500,
                            Colors.green.shade400,
                            Colors.green.shade300,
                            Colors.green.shade200,
                            Colors.green.shade100,
                            Colors.green.shade50,
                          ], // Set the gradient colors
                        ),
                        xValueMapper: (Data sales, _) => sales.monthName,
                        yValueMapper: (Data sales, _) => int.parse(sales.revenue),
                        name: 'Revenue',
                        animationDelay: 800,
                        animationDuration: 1200,
                      ),
                    ],
                    tooltipBehavior: TooltipBehavior(enable: true,),
                  ),
                ),
                widget2: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: colorGreen,
                    ),
                    SizedBox(width: 5),
                    Text("Revenue"),
                  ],
                )),
          ]),
        ));
  }

  Widget charts({
    required Widget widget1,
    required Widget widget2,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            widget1,
            SizedBox(height: 30),
            widget2,
          ],
        ),
      ),
    );
  }
}

class Data {
  Data({required this.monthName, required this.revenue});

  final String monthName;
  final String revenue;
}
