import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app_based_on_city/src/controlls/homecontrolls.dart';
import 'package:weather_app_based_on_city/src/model/fivedaysdata.dart';

// ignore: must_be_immutable
class Nextfivedayasgraph extends StatelessWidget {
   Nextfivedayasgraph({super.key,required this.controller});
Maincontrolls controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                                    height: 200,
                                             width:  MediaQuery.of(context).size.width,
                                             child:  Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25)
                                              
                                              ),
                                              child: SfCartesianChart(primaryXAxis:CategoryAxis(),
                                             series: <ChartSeries<FiveDaysss, String>>[
            SplineSeries<FiveDaysss, String>(
              dataSource: controller.list5days,
              xValueMapper: (FiveDaysss f, _) => f.dateTime,
              yValueMapper: (FiveDaysss f, _) => f.temp,
            ),
          ],
          
                                                
                                            ),
                                             ),
                                  );
  }
}