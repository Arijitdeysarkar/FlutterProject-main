import 'dart:convert';

import 'package:collge_erp_app/Service/Network/basic_api_service.dart';
import 'package:collge_erp_app/Service/Network/network_api_service.dart';
import 'package:collge_erp_app/const/app_url.dart';
import 'package:collge_erp_app/model/attendenceMod.dart';
import 'package:collge_erp_app/model/attendenceModel.dart';
import 'package:collge_erp_app/model/loginModel.dart';
import 'package:collge_erp_app/model/loginResponseModel.dart';
import 'package:collge_erp_app/model/userDetailModel.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AttendenceController extends GetxController{
  RxList<Result> attendencelist = <Result>[].obs;
  RxBool isCallingApi = false.obs;
  RxString userId = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetails();
  }
  void getDetails () async{
    var sharepref =await  SharedPreferences.getInstance();
    getAttendence(sharepref.getString('id')!);

  }

  Future<AttendenceModel> getAttendenceList(String val) async{
    // CircularProgressIndicator()
    final model = Attendence(
       id:val
    );

    print("========Model");
    print(model.toJson());


    final result = await http.post(
        Uri.parse(
            AppUrls.attendenceUrl),
        body: model.toJson()
    ).timeout(const Duration(seconds: 30));

    print("Attendence details");
    print(result.body);
    print(result.statusCode);
    if(result.statusCode == 200){
      Get.snackbar('GetStudentAttendence', 'Success' );
      isCallingApi.value = false;
      print("Attendence skjlsdhkjsdgk");
      // attendencelist.ad
    }else{
      isCallingApi.value = false;
      Get.snackbar('GetStudentAttendence', 'failed' );
    }
    return AttendenceModel.fromJson(json.decode(result.body));



  }
  void getAttendence (String val) async {
    isCallingApi.value = true;
    var responsee = await getAttendenceList(val);
    print("Attendence skjlsdhkjsdgk");
    print(responsee);
    if (responsee.success!) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      attendencelist.addAll(responsee.result as Iterable<Result>);
      isCallingApi.value = false;
    } else {
      isCallingApi.value = false;
    }
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}


