 import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app_based_on_city/src/api/services/weatherserviesesdata.dart';
import 'package:weather_app_based_on_city/src/model/currentweather.dart';
import 'package:weather_app_based_on_city/src/model/fivedaysdata.dart';

class Maincontrolls extends GetxController{

String city;
String? textfiled;
Maincontrolls({required this.city,});
List<CurrentWatherData> datalist=[];
CurrentWatherData currentWatherData=CurrentWatherData();
 List <FiveDaysss> list5days=[];
@override
  void onInit() {
    log("hi");
   initgetcurrentwatherdata();
   gettop6citesweather();
  getFivedaysDatas();
    super.onInit();
  }
void updateweather()
{
  onInit();
}

  void initgetcurrentwatherdata(){
    Weatherservieces(city: "$city").getcurrentwatherdata(onsuccess: (data) {

currentWatherData=data;
update();
    },
    oneror: (error) =>{
      log("error"),
      update()
    }
  
     );
  }
gettop6citesweather(){
List<String> cities=[

  "delhi",
  "america",
  "Nepal"
  "Kolkata ",
  "manjeri",
  "chennai",
  ];
  cities.forEach((element) {

    Weatherservieces(city: element).getcurrentwatherdata(onsuccess: (data) {
      datalist.add(data);
      update();

    } ,
    oneror: (error) {
      print("eroor");
      update();
      
    },
    );
  });

}
  void getFivedaysDatas() {
    Weatherservieces(city: '$city').getfivedaysdata(
        onsuccess: (data) {
          list5days = data;
          update();
        }, oneror: (error) {
      print(error);
      update();
    });
  }

}