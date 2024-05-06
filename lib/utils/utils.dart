import 'package:collge_erp_app/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppUtils {
  static showError(String msg) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
        backgroundColor: red.withOpacity(0.4),
        message: msg,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.only(bottom: 10, left: 0, right: 0)));
  }

  static toastMessage(String message){
    Get.showSnackbar(GetSnackBar(
        message: message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.only(bottom: 10, left: 0, right: 0)));
  }
}