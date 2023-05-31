// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_list_app/projects/customChart/customCharts2.dart';
import 'package:task_list_app/styles/color.dart';

class CustomChartScreen extends StatefulWidget {
  CustomChartScreen({Key? key}) : super(key: key);

  @override
  _CustomChartScreenState createState() => _CustomChartScreenState();
}

class _CustomChartScreenState extends State<CustomChartScreen> with TickerProviderStateMixin{

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
    Data(monthName: 'Jan', revenue: "16", forcast: "8"),
    Data(monthName: 'Feb', revenue: "8", forcast: "10"),
    Data(monthName: 'Mar', revenue: "18", forcast: "25"),
    Data(monthName: 'Apr', revenue: "25", forcast: "7"),
    Data(monthName: 'May', revenue: "12",forcast: "18")];

    double width = 0.6;
    double spacing = 0.1;
    Color colorGreen = Color(0xff17cf98);

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
                      numberFormat: NumberFormat('\$#K'),
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
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          dataSource: data,
                          color: colorGreen,
                          xValueMapper: (Data sales, _) => sales.monthName,
                          yValueMapper: (Data sales, _) => int.parse(sales.revenue),
                          name: 'Revenue',
                          animationDelay: 800,
                          animationDuration: 2000,
                      ),
                      ColumnSeries<Data, String>(
                          dataSource: data,
                          width: width,
                          spacing: spacing,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          color: Color(0xffd9d9d9),
                          xValueMapper: (Data sales, _) => sales.monthName,
                          yValueMapper: (Data sales, _) => int.parse(sales.forcast),
                          name: 'Forcast',
                          animationDelay: 800,
                        animationDuration: 2000,
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
                    SizedBox(width: 20),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Color(0xffd9d9d9),
                    ),
                    SizedBox(width: 5),
                    Text("Forcast"),
                  ],
                )),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomChart2Screen()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, // text color
                  side:   BorderSide(width: 2, color: Colors.black), // outline border
                ),
                child: Text('Next'),
              ),
            ),
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
  Data({required this.monthName, required this.revenue, required this.forcast});

  final String monthName;
  final String revenue;
  final String forcast;
}
