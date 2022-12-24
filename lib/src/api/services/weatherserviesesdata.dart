import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:weather_app_based_on_city/src/api/services/apirepository.dart';
import 'package:weather_app_based_on_city/src/model/currentweather.dart';
import 'package:weather_app_based_on_city/src/model/fivedaysdata.dart';

class Weatherservieces {
  final String? city;
 final  String base_url ="https://api.openweathermap.org/data/2.5";
  final String api_key ="1827b9da2aab81d5a6e630bf44dbaf9d";
  final String key2="b02af426a3fad0d92d3e0b32f9324cf0";
  Weatherservieces({this.city});
  void getcurrentwatherdata({
  
    Function()? beforesend,
    Function(CurrentWatherData getcurrentwatherdata)? onsuccess,
    Function(dynamic error)? oneror,
  }) {
    final url = "$base_url/weather?q=$city&lang=en&appid=$api_key";
    Apirepository(url: url,).get(
        beforsend: () => {
          print("ghii"),
              if (beforesend != null) {beforesend()},
            },
        onsuccess: (data) => {onsuccess!(CurrentWatherData.fromJson(data))
        
        },
        oneror: (error) => {
          print("notset"),
              if (oneror != null) {oneror(error)}
            });
  }

//------------------------------------------------------------


  void getfivedaysdata({
    Function()? beforesend,
    Function(List<FiveDaysss> fivedadydata)? onsuccess,
    Function(dynamic error)? oneror,
  }) {
    final url ="$base_url/forecast?q=$city&lang=en&appid=$api_key";
    Apirepository(url: url,payload: null ).get(
      beforsend: () {
        
      },
      onsuccess: (data)=> {
        onsuccess!((data["list"] as List).map((e) => FiveDaysss.fromJson(e)).toList())
      },
      oneror: (error) {
        print(error);
      },
    );
  }
  void getfivedays3houresforcatinddata({
    Function()? beforesend,
    Function(dynamic getcurrentwatherdata)? onsuccess,
    Function(dynamic error)? oneror,
  }) {}
}
