import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app_based_on_city/src/const/const.dart';
import 'package:weather_app_based_on_city/src/controlls/homecontrolls.dart';
import 'package:weather_app_based_on_city/src/model/currentweather.dart';
import 'package:weather_app_based_on_city/src/model/fivedaysdata.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<Maincontrolls>(
        builder: (controller) => Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/bjark-DZ975EkUJH0-unsplash.jpg"),
                          fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Stack(
                    children: [
                      Container(
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                              onPressed: () {}, icon: Icon(Icons.menu)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 100, left: 20, right: 20),
                        child: TextField(
                          onChanged: (value) {
                            controller.city=value;
                          },
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            controller.updateweather(); 
                        },
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.search),
                              hintText: "search",
                              hintStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              )),
                        ),
                      ),
                      Align(
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
                                                              letterSpacing: 3,
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
                                                    Container(
                                                      child: Text(
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
                                                      ),
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
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                          padding: const EdgeInsets.only(top: 120),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text(
                                    "other city".toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: black45),
                                  )),
                                  Container(
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
                                          return Container(
                                              width: 140,
                                              height: 150,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        (data != null)
                                                            ? "${data.name}"
                                                            : "",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 18,
                                                                color: black45),
                                                      ),
                                                      Text(
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
                                                      Container(
                                                        child: Text(
                                                          (data != null)
                                                              ? "${(data.weather![0].description)}"
                                                              : "",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 18,
                                                                  letterSpacing:
                                                                      1,
                                                                  color:
                                                                      black45),
                                                        ),
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Next 5 days data".toUpperCase(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: black45
                                            ),

                                          ),
                                          Icon(Icons.next_plan_outlined,color: black45,)
                                        ],
                                      ),

                                    ),
                                  ),
                                  Container(
                                    height: 260,
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
                                  )
                                ]),
                          )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
