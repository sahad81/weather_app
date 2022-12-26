import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_based_on_city/src/const/const.dart';
import 'package:weather_app_based_on_city/src/controlls/homecontrolls.dart';

// ignore: must_be_immutable
class Maincard extends StatelessWidget {
   Maincard({super.key,required this.controller});
 Maincontrolls controller;
  @override
  Widget build(BuildContext context) {
   
    return       Align(
                        alignment: const Alignment(0.0, 1.0),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: OverflowBox(
                            minHeight: 0,
                            maxHeight: MediaQuery.of(context).size.height / 4,
                            minWidth: 0,
                            maxWidth: (MediaQuery.of(context).size.width),
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 6,
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                  child: Text(
                                                      // ignore: unnecessary_null_comparison
                                                      (controller.currentWatherData !=
                                                              null)
                                                          ? "${controller.currentWatherData.name}"
                                                              .toUpperCase()
                                                          : " error",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              letterSpacing: 6,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                              Center(
                                                child: Text(
                                                  DateFormat()
                                                      .add_MMMMEEEEd()
                                                      .format(DateTime.now()),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 25, right: 25),
                                          child: Divider(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 50),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      (controller.currentWatherData
                                                                  .weather) !=
                                                              null
                                                          ? "${controller.currentWatherData.weather![0].description}"
                                                          : "",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 22,
                                                              color: black45,
                                                            
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    Text(
                                                      (controller.currentWatherData
                                                                  .main !=
                                                              null)
                                                          ? ('${(controller.currentWatherData.main!.temp! - 274.15).round().toString()}\u2103')
                                                          : "",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 40,
                                                              color: black45),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 6),
                                                      child: Text(
                                                        (controller.currentWatherData
                                                                    .main !=
                                                                null)
                                                            ? " min :${(controller.currentWatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max :${(controller.currentWatherData.main!.tempMax! - 273.15).round().toString()}\u2103"
                                                            : "",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12,
                                                                color: black45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/noun-sunny-3545854.jpg"),
                                                                  fit: BoxFit
                                                                      .cover)),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      (controller.currentWatherData
                                                                  .main !=
                                                              null)
                                                          ? " wind  ${controller.currentWatherData.wind!.speed}m/s"
                                                          : "",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: black45),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
  }
}