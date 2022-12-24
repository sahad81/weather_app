import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_based_on_city/src/ui/screens/homebindingd.dart';
import 'package:weather_app_based_on_city/src/ui/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages:[
        GetPage(name: "/"
        , page:()=> const HomePage(),
        binding: Homebindings()
        )
        
        


      ],
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        // This is the theme of your application.
       
        primarySwatch: Colors.blueGrey,
      ),
      
     // home: HomePage()
    );
  }
}


