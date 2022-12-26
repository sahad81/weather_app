import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_based_on_city/src/const/const.dart';
import 'package:weather_app_based_on_city/src/controlls/homecontrolls.dart';
import 'package:weather_app_based_on_city/src/model/currentweather.dart';

// ignore: must_be_immutable
class Othercity extends StatelessWidget {
   Othercity({super.key,required this.controller});

Maincontrolls controller;
  @override
  Widget build(BuildContext context) {
    return 
        SizedBox(
                                    height: 150,
                                    child: ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          CurrentWatherData? data;
                                          (controller.datalist.isNotEmpty)
                                              ? data =
                                                  controller.datalist[index]
                                              : null;
                                          return SizedBox(
                                              width: 140,
                                              height: 150,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                // ignore: avoid_unnecessary_containers
                                                child: Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                     
                                                             "${data!.name}"
                                                        ,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 18,
                                                                color: black45),
                                                      ),
                                                      Text(
                                                        // ignore: unnecessary_null_comparison
                                                        (data != null)
                                                            ? "${(data.main!.temp! - 273.15).round().toString()}\u2103"
                                                            : "",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 18,
                                                                color: black45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      Container(
                                                        width: 60,
                                                        height: 50,
                                                        decoration: const BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/noun-sunny-3545854.jpg"),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      Text(
                                                        "${(data.weather![0].description)}",
                                                        
                                                        style: GoogleFonts
                                                            .poppins(
                                                                fontSize: 12,
                                                              
                                                                color:
                                                                    black45),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        },
                                        separatorBuilder: (context, index) {
                                          return const VerticalDivider(
                                            color: Colors.transparent,
                                            width: 6,
                                          );
                                        },
                                        itemCount: controller.datalist.length),
                                  );
      }
}