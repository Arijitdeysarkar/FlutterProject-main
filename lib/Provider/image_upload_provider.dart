import 'dart:io';

import 'package:collge_erp_app/const/app_url.dart';
import 'package:get/get.dart';

class ImageUploadProvider extends GetConnect{
  Future<String> uploadImage (File file,String email) async {
    try {
      print(file);
      final form = FormData({
        'avatar': MultipartFile(file, filename: 'avi.jpg'),
        'email':email
      });
      final response = await post(AppUrls.profileUpdateUrl, form);
      if (response.statusCode != 200) {
        return Future.error(response.body);
      } else {
        return response.body['email'];
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }}