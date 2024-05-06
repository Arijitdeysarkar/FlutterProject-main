import 'dart:async';

import 'package:collge_erp_app/const/app_url.dart';
import 'package:collge_erp_app/model/previousChatListModel.dart';
import 'package:collge_erp_app/model/studentByNameMod.dart';
import 'package:collge_erp_app/model/studentByNameModel.dart';
import 'package:collge_erp_app/view/SearchChatList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatListController extends GetxController {
  RxList<Result> chatlist = <Result>[].obs;
  RxList<Result> chatlistNew = <Result>[].obs;

  RxList<Resultt> searchStulist = <Resultt>[].obs;

  RxBool isCallingApi = false.obs;
  TextEditingController searchInputController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetails();
  }
 void getDetails () async{
    var sharepref =await  SharedPreferences.getInstance();
    getChatList(sharepref.getString('name')!);

  }

   Future<previousChatListModel> getChatListApi(String val) async{
    // CircularProgressIndicator()
    final result = await http.get(
        Uri.parse(
            "http://localhost:5000/api/student/chat/previousChats/$val"),
    ).timeout(const Duration(seconds: 30));

    print("GetChatList details");
    print(result.body);
    print(result.statusCode);
    if(result.statusCode == 200){
      Get.snackbar('GetChatList', 'Success' );
      isCallingApi.value = false;
      print("GetChatList skjlsdhkjsdgk");
      // attendencelist.ad
    }else{
      isCallingApi.value = false;
      Get.snackbar('GetChatList', 'failed' );
    }
    return previousChatListModel.fromJson(json.decode(result.body));
  }
     Future<previousChatListModel> getNewChatListApi(String val) async{
    // CircularProgressIndicator()
    final result = await http.get(
        Uri.parse(
            "http://localhost:5000/api/student/chat/newerChats/$val"),
    ).timeout(const Duration(seconds: 30));

    print("GetChatList details");
    print(result.body);
    print(result.statusCode);
    if(result.statusCode == 200){
      // Get.snackbar('GetChatList', 'Success' );
      isCallingApi.value = false;
      print("GetChatList skjlsdhkjsdgk");
      // attendencelist.ad
    }else{
      isCallingApi.value = false;
      // Get.snackbar('GetChatList', 'failed' );
    }
    return previousChatListModel.fromJson(json.decode(result.body));
  }
    void getChatList (String val) async {
    isCallingApi.value = true;
    print('namamma$val');
    var responsee = await getChatListApi(val);
    var responsee2 = await getNewChatListApi(val);

    print("Attendence skjlsdhkjsdgk");
    print(responsee2);
    if (responsee.status!) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      chatlist.addAll(responsee.result as Iterable<Result>);
     
      chatlist.toSet().toList();
      isCallingApi.value = false;
    } else {
      isCallingApi.value = false;
    }
    
    if (responsee2.status!) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      chatlistNew.addAll(responsee2.result as Iterable<Result>);
     
      chatlistNew.toSet().toList();
      isCallingApi.value = false;
    } else {
      isCallingApi.value = false;
    }
  }

     Future<studentByNameModel> searchStudentApi() async{
    // CircularProgressIndicator()
        final model = studentByNameMod(
       name:searchInputController.text.trim(),
    );

    print("========Model");
    print(model.toJson());
    final result = await http.post(
        Uri.parse(
           AppUrls.searchStudent),
        body:model.toJson()
    ).timeout(const Duration(seconds: 30));

    print("searchStudentApi details");
    print(result.body);
    print(result.statusCode);
    if(result.statusCode == 200){
      Get.snackbar('Search Student', 'Success' );
      isCallingApi.value = false;
      print("searchStudentApi skjlsdhkjsdgk");
      // attendencelist.ad
    }else{
      isCallingApi.value = false;
      Get.snackbar('Search Student', 'No Student Found!' );
    }
    return studentByNameModel.fromJson(json.decode(result.body));
  }


void getStudentByNameList () async {
  if(searchInputController.text.length > 1){
    searchStulist.clear();
    isCallingApi.value = true;
    var responsee = await searchStudentApi();
    print("Attendence skjlsdhkjsdgk");
    print('getStudentByNameList${responsee.result}');
    if (responsee.status!) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      searchStulist.addAll(responsee.result as Iterable<Resultt>);
      //  Timer(const Duration(seconds:1), () {
      isCallingApi.value = false;
      Get.to(()=>SearchChatListPage(),transition: Transition.rightToLeft);
      searchInputController.clear();
      //  });

    } else {
      isCallingApi.value = false;
    }
  }
  else{
      Get.snackbar('Waring!', 'minimun two letter required to search!' );

  }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}