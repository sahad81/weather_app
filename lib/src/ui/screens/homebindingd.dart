
import 'package:get/get.dart';
import 'package:weather_app_based_on_city/src/controlls/homecontrolls.dart';

class Homebindings implements Bindings {


@override
  void dependencies() {
    Get.lazyPut(() => Maincontrolls(city: "malappuram"));
  }
}