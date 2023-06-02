// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_list_app/projects/customChart/customCharts3.dart';
import 'package:task_list_app/projects/customChart/customCharts5.dart';
import 'package:task_list_app/styles/color.dart';

class CustomChart4Screen extends StatefulWidget {
  CustomChart4Screen({Key? key}) : super(key: key);

  @override
  _CustomChart4ScreenState createState() => _CustomChart4ScreenState();
}

class _CustomChart4ScreenState extends State<CustomChart4Screen> with TickerProviderStateMixin {

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
      Data(monthName: 'Feb', revenue: "8", forcast: "9"),
      Data(monthName: 'Mar', revenue: "15", forcast: "9"),
      Data(monthName: 'Apr', revenue: "11", forcast: "9"),
      Data(monthName: 'May', revenue: "6", forcast: "10"),
      Data(monthName: 'Jun', revenue: "12", forcast: "9"),
      Data(monthName: 'Jul', revenue: "18", forcast: "10"),
      Data(monthName: 'Aug', revenue: "22", forcast: "11"),
      Data(monthName: 'Sep', revenue: "7", forcast: "10")
    ];

    Color colorBlue = Color(0xffed6b3c);

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
                              majorTickLines: const MajorTickLines(size: 0),
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
                              majorGridLines: const MajorGridLines(width: 0),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            series: <ChartSeries>[
                              SplineAreaSeries<Data, String>(
                                dataSource: dataSpline,
                                color: colorBlue,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter, // Set the start position of the gradient
                                  end: Alignment.bottomCenter, // Set the end position of the gradient
                                  colors: [
                                    Colors.red.shade900,
                                    Colors.red.shade500,
                                    Colors.red.shade400,
                                    Colors.red.shade300,
                                    Colors.red.shade200,
                                    Colors.red.shade100,
                                    Colors.red.shade50,
                                  ], // Set the gradient colors
                                ),
                                splineType: SplineType.monotonic,
                                enableTooltip: true,
                                markerSettings: MarkerSettings(isVisible: false),
                                xValueMapper: (Data sales, _) => sales.monthName,
                                yValueMapper: (Data sales, _) => int.parse(sales.revenue),
                                name: 'Revenue',
                                animationDelay: 800,
                                animationDuration: 2000,
                              ),
                            ],
                              plotAreaBorderColor: Colors.amber,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomChart5Screen()));
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
