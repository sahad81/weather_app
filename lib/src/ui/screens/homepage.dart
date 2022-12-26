import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_app_based_on_city/src/const/const.dart';
import 'package:weather_app_based_on_city/src/controlls/homecontrolls.dart';

import 'package:weather_app_based_on_city/src/ui/widgets/maincard.dart';
import 'package:weather_app_based_on_city/src/ui/widgets/nextfivedaysgrap.dart';
import 'package:weather_app_based_on_city/src/ui/widgets/othercity.dart';
import 'package:weather_app_based_on_city/src/ui/widgets/textfiled.dart';

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
                    children: [Textfiled(),
                    // ignore: unrelated_type_equality_checks
                    controller.isloadingforcurrentdata==false?
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                    :
                     Maincard(controller: controller)],
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
                                  Text(
                                    "other city".toUpperCase(),
                                    style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: black45),
                                  ),
                                
                                  // ignore: unrelated_type_equality_checks
                                  controller.isloadingmaiicitydata==false?
                                  const Center(child: CircularProgressIndicator(),)
                                :   Othercity(controller: controller),
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
                                                color: black45),
                                          ),
                                          Icon(
                                            Icons.next_plan_outlined,
                                            color: black45,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Nextfivedayasgraph(
                                    controller: controller,
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
