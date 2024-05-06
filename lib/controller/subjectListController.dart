// ignore_for_file: prefer_is_empty, avoid_print

import 'dart:convert';

import 'package:collge_erp_app/Service/Network/basic_api_service.dart';
import 'package:collge_erp_app/Service/Network/network_api_service.dart';
import 'package:collge_erp_app/const/app_url.dart';
import 'package:collge_erp_app/model/subjectListMod.dart';
import 'package:collge_erp_app/model/subjectListModel.dart';
import 'package:collge_erp_app/model/userDetailModel.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubjectListController extends GetxController{
  RxList<Result> subjectlist = <Result>[].obs;
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
    getSubject(sharepref.getString('department')!,sharepref.getString('year')!);

  }
 

  Future<SubjectListModel> getSubjectList(String val,String val1) async{
    // CircularProgressIndicator()
    final model = SubjectListMod(
       department: val,
        year: val1
    );

    print("========Model");
    print(model.toJson());


    final result = await http.post(
        Uri.parse(
            AppUrls.subjectListUrl),
        body: model.toJson()
    ).timeout(const Duration(seconds: 30));

    print("Attendence details");
    print(result.body);
    print(result.statusCode);
    if(result.statusCode == 200){
      Get.snackbar('GetStudentAttendence', 'Success' );
      isCallingApi.value = false;
      print("Subdbfd skjlsdhkjsdgk");
      // attendencelist.ad
    }else{
      isCallingApi.value = false;
      Get.snackbar('GetStudentASubbfdb', 'failed' );
    }
    return SubjectListModel.fromJson(json.decode(result.body));



  }
  void getSubject (String val,String vala) async {
    isCallingApi.value = true;
    var responsee = await getSubjectList(val,vala);
   
    print("Attendence skjlsdhkjsdgk");
    print(responsee);
    if (responsee.result?.length!=0) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      subjectlist.addAll(responsee.result as Iterable<Result>);
      isCallingApi.value = false;
    } else {
      isCallingApi.value = false;
    }
  }

}
