import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Textfiled extends StatelessWidget {
   Textfiled({super.key, required this.city,required this.fn});
 String city;
 Function fn;
  @override
  Widget build(BuildContext context) {
    return   Container(
                        padding: const EdgeInsets.only(
                            top: 100, left: 20, right: 20),
                        child: TextField(
                          onChanged: (value) {
                            city=value;
                          },
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            fn;
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