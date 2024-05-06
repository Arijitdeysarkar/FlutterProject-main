import 'package:collge_erp_app/controller/ChatListController.dart';
import 'package:collge_erp_app/controller/ExamFeePayController.dart';
import 'package:collge_erp_app/controller/ProfileUpdateController.dart';
import 'package:collge_erp_app/controller/attendenceController.dart';
import 'package:collge_erp_app/controller/giveAttendenceController.dart';
import 'package:collge_erp_app/controller/logincontroller.dart';
import 'package:collge_erp_app/controller/signupcontroller.dart';
import 'package:collge_erp_app/controller/subjectListController.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AttendenceController>(() => AttendenceController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<ProfileUpdateController>(() => ProfileUpdateController());
    Get.lazyPut<SubjectListController>(() => SubjectListController());
    // Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<giveAttendenceController>(() => giveAttendenceController());
    Get.lazyPut<ExamFeePayController>(() => ExamFeePayController());
    // Get.lazyPut<ChatListController>(() => ChatListController());


  }

}