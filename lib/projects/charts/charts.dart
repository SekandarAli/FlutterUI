// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({Key? key}) : super(key: key);

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<SalesData> data = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 15),
    SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              charts(
                  widget: SfCartesianChart(
                    enableAxisAnimation: true,
                    tooltipBehavior: TooltipBehavior(enable: true),
                    primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    minorGridLines: MinorGridLines(width: 0),
                    isVisible: true,
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                primaryYAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    minorGridLines: MinorGridLines(width: 0),
                    isVisible: true,
                    borderWidth: 0,
                    axisLine: AxisLine(width: 0),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                plotAreaBorderWidth: 0,
                borderWidth: 0,
                borderColor: Colors.transparent,
                series: <ColumnSeries<SalesData, String>>[
                  ColumnSeries<SalesData, String>(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      dataSource: data,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) {
                        if (sales.sales > 30) {
                          return Colors.cyan;
                        } else {
                          return Colors.cyan.shade50;
                        }
                      }),
                ],
              )),
              SizedBox(height: 20),
              charts(widget: SfCircularChart(
                enableMultiSelection: true,
                  series: <CircularSeries<SalesData, String>>[
                    PieSeries<SalesData, String>(
                  dataSource: data,
                  explode: true,
                  explodeIndex: 0,
                  xValueMapper: (SalesData data, _) => data.year,
                  yValueMapper: (SalesData data, _) => data.sales,
                  dataLabelMapper: (SalesData data, _) => data.year,
                  dataLabelSettings: DataLabelSettings(isVisible: true)
                  ),
                ],
              )),
              SizedBox(height: 20),
              charts(
                  widget: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      legend: Legend(isVisible: false),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        dataSource: data,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ])),
              SizedBox(height: 20),
              charts(widget:  SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  minorGridLines: MinorGridLines(width: 0),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  minorGridLines: MinorGridLines(width: 0),
                  isVisible: false
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ColumnSeries<SalesData, String>>[
                  ColumnSeries<SalesData, String>(
                    color: Colors.cyan.shade300,
                    dataSource: data,
                    xValueMapper: (SalesData data, _) => data.year,
                    yValueMapper: (SalesData data, _) => data.sales,
                  ),
                ],
              )),
              SizedBox(height: 20),
              charts(widget: SfCartesianChart(
                  enableAxisAnimation: true,
                  primaryXAxis: CategoryAxis(
                    labelStyle: TextStyle(fontSize: 15),
                    maximumLabels: 100,
                    autoScrollingDelta: 4,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                      numberFormat: NumberFormat(''),
                      minimum: 1.0,
                      majorGridLines: MajorGridLines(
                        width: 0,
                      )),
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true,
                    enableDoubleTapZooming: true,
                    enablePinching: true
                  ),
                  series: <ChartSeries>[
                    ColumnSeries<SalesData, String>(
                        dataSource: data,
                        xValueMapper: (SalesData data, _) => data.year,
                        yValueMapper: (SalesData data, _) => data.sales,
                        pointColorMapper: (SalesData data, _) => Colors.cyan.shade200,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        emptyPointSettings: EmptyPointSettings(
                            mode: EmptyPointMode.drop)),
                  ])),
              SizedBox(height: 20),
              charts(
                  widget: SfSparkLineChart.custom(
                axisLineWidth: 0,
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              )),
            ]),
          ),
        ));
  }

  Widget charts({
    required Widget widget,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: widget,
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
