import 'dart:convert';

import 'package:collge_erp_app/const/app_url.dart';
import 'package:collge_erp_app/model/getAllExamModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ExamFeePayController extends GetxController {
  RxList<Result> examList = <Result>[].obs;
  RxString examName = "".obs;
  RxString examFees = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getExams();
  }

  Future<getAllExamModel> getAllExam() async {
    final result = await http
        .get(Uri.parse(AppUrls.getallexam))
        .timeout(const Duration(seconds: 30));
    print("GetAllExam details");
    print(result.body);
    print(result.statusCode);
    if(result.statusCode == 200){
      Get.snackbar('GetAllExam', 'Success' );
      // isCallingApi.value = false;
      print("GetAllExam skjlsdhkjsdgk");
      // attendencelist.ad
    }else{
      // isCallingApi.value = false;
      Get.snackbar('GetAllExam', 'failed' );
    }
    return getAllExamModel.fromJson(json.decode(result.body));
  }

    void getExams () async {
    // isCallingApi.value = true;
    var responsee = await getAllExam();
   
    print("Attendence skjlsdhkjsdgk");
    print(responsee);
    if (responsee?.result?.length != 0) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      examList.addAll(responsee.result as Iterable<Result>);
      // isCallingApi.value = false;
    } else {
      // isCallingApi.value = false;
      print('erorror');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
