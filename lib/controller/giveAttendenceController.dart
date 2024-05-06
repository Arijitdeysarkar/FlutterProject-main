import 'dart:convert';

import 'package:collge_erp_app/const/app_url.dart';
import 'package:collge_erp_app/model/fetchStudentMod.dart';
import 'package:collge_erp_app/model/getStudentModel.dart';
import 'package:collge_erp_app/model/markAttendenceMod.dart';
import 'package:collge_erp_app/model/markAttendenceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class giveAttendenceController extends GetxController {
  RxList<String> Years = ["1", "2", "3", "4"].obs;
  RxList<String> Sections = ["A", "B", "C", "D"].obs;
  // ignore: non_constant_identifier_names
  RxList<Result> StudentList = <Result>[].obs;
  RxList<String> subjectCode = <String>[].obs;
  RxList<String> selectedStudent = <String>[].obs;
  RxString selectedSubject = "".obs;
  RxString Dept = "".obs;
  RxString year = "".obs;
  RxString section = "".obs;
  RxBool isCallingApi = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetails();
  }

  void getDetails() async {
    var sharepref = await SharedPreferences.getInstance();
    Dept.value = sharepref.getString('department')!;
  }

  Future<getStudentModel> getAllStudentDetails(String val) async {
    final model = fetchStudentMod(
        department: val, year: year.value, section: section.value);

    print("========Model");
    print(model.toJson());

    final result = await http
        .post(Uri.parse(AppUrls.fetchStudent), body: model.toJson())
        .timeout(const Duration(seconds: 30));

    print("Attendence details");
    print(result.body);
    print(result.statusCode);
    if (result.statusCode == 200) {
      Get.snackbar('GetStudent', 'Success');
      isCallingApi.value = false;
      print("Attendence skjlsdhkjsdgk");
      // attendencelist.ad
    } else {
      isCallingApi.value = false;
      Get.snackbar('GetStudent', 'No Student Found');
    }
    return getStudentModel.fromJson(json.decode(result.body));
    // }
  }

  Future<markAttendenceModel> markattendenceApi() async {
    final model = markAttendenceMod(
        department: Dept.value,
        year: year.value,
        section: section.value,
        subjectCode: selectedSubject.value,
        selectedStudents: selectedStudent);
        
    final result = await http
        .post(Uri.parse(AppUrls.markAttendences), 
        body: jsonEncode(model.toJson()),
        headers: { 'Content-type': 'application/json',
        'Accept': 'application/json'},
        )
        .timeout(const Duration(seconds: 30));
    print(result.body);
    print(result.statusCode);
    if (result.statusCode == 200) {
      Get.snackbar('Mark Attendence', 'Success');
      isCallingApi.value = false;
    } else {
      isCallingApi.value = false;
      Get.snackbar('Mark Attendence', 'Failed');
    }
    return markAttendenceModel.fromJson(json.decode(result.body));
  }

  void getStudent(String val) async {
    isCallingApi.value = true;
    var responsee = await getAllStudentDetails(val);
    print("Attendence skjlsdhkjsdgk");
    print(responsee.result);
    if (responsee.status!) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      print("Attendence 23223");
      StudentList.addAll(responsee.result as Iterable<Result>);
      subjectCode.addAll(responsee.subjectCode as Iterable<String>);
      isCallingApi.value = false;
    } else {
      isCallingApi.value = false;
      Get.snackbar('GetStudent', 'failed');
    }
  }

  void markedAttendence() async {
    isCallingApi.value = true;
    var responsee = await markattendenceApi();
    print("markedAttendence skjlsdhkjsdgk");
    print(responsee);
    if (responsee.status!) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      print("markedAttendence 23223");
      StudentList.clear();
      StudentList.refresh();
      subjectCode.clear();
      subjectCode.refresh();
      selectedStudent.clear();
      selectedStudent.refresh();
      year.value = "";
      section.value = "";
      selectedSubject.value = "";
      isCallingApi.value = false;
    } else {
      isCallingApi.value = false;
      Get.snackbar('markedAttendence', 'failed');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

enum year {
  blue('1', Colors.blue),
  pink('2', Colors.pink),
  green('3', Colors.green),
  yellow('4', Colors.orange);

  const year(this.label, this.color);
  final String label;
  final Color color;
}
