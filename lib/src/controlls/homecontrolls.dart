 import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app_based_on_city/src/api/services/weatherserviesesdata.dart';
import 'package:weather_app_based_on_city/src/model/currentweather.dart';
import 'package:weather_app_based_on_city/src/model/fivedaysdata.dart';

class Maincontrolls extends GetxController{

String? city;
String? textfiled;

Maincontrolls({ this.city,});

RxBool isloadingforcurrentdata=false.obs;
RxBool isloadingmaiicitydata=false.obs;
RxBool isloading5daysdata=false.obs;


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
  isloadingforcurrentdata.value=false;
  
  onInit();
}

  void initgetcurrentwatherdata(){
    Weatherservieces(city: "$city").getcurrentwatherdata(onsuccess: (data) {

currentWatherData=data;
update();
isloadingforcurrentdata.value=true;
    },
    oneror: (error) =>{
      log("error"),
     Get.snackbar("error", "please try again later..."),
      update()
    }
  
     );
  }
gettop6citesweather(){
List<String> cities=[

  "delhi",
  "america",
 
 
  "manjeri",
  "chennai",
  ];
  cities.forEach((element) {

    Weatherservieces(city: element).getcurrentwatherdata(onsuccess: (data) {
      datalist.add(data);
      update();
      isloadingmaiicitydata.value=true;

    } ,
    oneror: (error) {
     
      // Get.snackbar("error", "please try again later...");
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
   Get.snackbar("error", "please try again later...");
      update();
    });
    
  }

}