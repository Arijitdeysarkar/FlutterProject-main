import 'dart:convert';
import 'dart:io';

import 'package:collge_erp_app/Service/AppException.dart';
import 'package:collge_erp_app/Service/Network/basic_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class NetworkApiService extends BasicApiService{

  @override
  Future getApiResponse(String url, dynamic header) async{
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    dynamic responseJson;
    try{
      final response = await http.get(
          Uri.parse(url),
          headers: requestHeaders
      ).timeout(const Duration(seconds: 30));
      responseJson = _returnResponse(response);
    }on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url,dynamic method ,dynamic body) async{
    Map<String, String> requestHeaders = method == METHOD.MULTIPART
        ? {
      'Content-type': 'multipart/form-data',
    }
        : {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    dynamic responseJson;
    print(body);
    try{
      final response = await http.post(
          Uri.parse(url),
          headers: requestHeaders,
          body: body
      ).timeout(const Duration(seconds: 30));
      responseJson = _returnResponse(response);
      Get.snackbar('Login', 'Success');
    }on SocketException {
      throw FetchDataException("No Internet Connection");
    }catch(e){
      Get.snackbar('Login', e.toString());
    }
    return responseJson;
  }

}

dynamic _returnResponse(http.Response response) {
  print(response);

  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(
          const Utf8Decoder().convert(response.body.toString().codeUnits));
      debugPrint("Result : $responseJson");
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 402:
      throw UnauthorisedException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(response.body);
  }
}

// Future<bool> networkCheck() async {
//   try {
//     final result = await InternetAddress.lookup('${Url.baseUrl}');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return false;
//     } else {
//       return true;
//     }
//   } on SocketException catch (_) {
//     return true;
//   }
// }

Widget normalLoader() {
  return Center(
      child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius:
              const BorderRadius.all(Radius.circular(40))),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 1.5,
            ),
          )));
}


enum METHOD {
  GET,
  PUT,
  POST,
  DELETE,
  PATCH,
  MULTIPART,
}

enum SSL {
  HTTP,
  HTTPS,
}
