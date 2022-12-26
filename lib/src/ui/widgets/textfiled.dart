

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_based_on_city/src/controlls/homecontrolls.dart';


class Textfiled extends StatelessWidget {
  const Textfiled({super.key});

 

  @override
  Widget build(BuildContext context) {
    final controleyr =Get.put(Maincontrolls());
    return   Container(
                        padding: const EdgeInsets.only(
                            top: 100, left: 20, right: 20),
                        child: TextField(
                          onChanged: (value) {
                            controleyr.city=value;
                            
                          },
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            
                           controleyr.updateweather();
                          
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
                      );
  }
}