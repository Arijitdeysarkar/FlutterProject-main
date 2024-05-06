import 'package:collge_erp_app/model/getMessageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChatController extends GetxController {
  RxList<Result> messageList = <Result>[].obs;
RxBool isCallingApi = false.obs;
  TextEditingController sendMessageController = TextEditingController();
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }






  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
