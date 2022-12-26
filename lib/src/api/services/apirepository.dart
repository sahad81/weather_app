import 'dart:developer';

import 'package:dio/dio.dart';

class Apirepository{
 final String url;
  final Map<String,dynamic>? payload;
  Apirepository({required this.url,this.payload});
  final Dio _dio = Dio();
  void get({
     Function()? beforsend,
 Function(dynamic data)? onsuccess,
Function (dynamic error)? oneror,




  })
  {
  _dio.get(url,queryParameters: payload).then((response) {
if(onsuccess !=null){
  onsuccess(response.data);

}

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  }).catchError((Error){
    if(oneror !=null){
      oneror(Error);
log("error in reposetory");
    }
  });
  }

}