import 'dart:convert';

import 'package:collge_erp_app/Service/Network/basic_api_service.dart';
import 'package:collge_erp_app/Service/Network/network_api_service.dart';
import 'package:collge_erp_app/const/app_url.dart';
import 'package:collge_erp_app/model/loginModel.dart';
import 'package:collge_erp_app/model/loginResponseModel.dart';
import 'package:collge_erp_app/model/userDetailModel.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
  TextEditingController registrationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isCallingLoginApi = false.obs;
  late Student userDetails;
  @override
  onInit(){
    super.onInit();

  }
   @override
  void dispose() {
     registrationController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<LoginResponse> userlogin(String type) async{
  // CircularProgressIndicator()
    BasicApiService service = NetworkApiService();
    final model = LoginModel(
        registrationNumber: registrationController.text.trim(),
        password: passwordController.text.trim());

    print("========Model");
    print(model.toJson());

    // var result = await service.postApiResponse(
    //    AppUrls.loginUrl,
    //    METHOD.POST,
    //    model.toJson()
    // );
    final result = await http.post(
        Uri.parse(type == 'Student' ? AppUrls.loginUrl : type == 'Admin' ? AppUrls.adminloginUrl : AppUrls.facultyloginUrl),
        body: model.toJson()
    ).timeout(const Duration(seconds: 30));
    print("Login details");
    print(result.body);
    print(result.statusCode);
    if(result.statusCode == 200){
      Get.snackbar('Login', 'Success' );
      isCallingLoginApi.value = false;
      registrationController.clear();
      passwordController.clear();
    }else{
      isCallingLoginApi.value = false;
      Get.snackbar('Login', 'failed' );
    }
    return LoginResponse.fromJson(json.decode(result.body));



  }
  void login () async{
    isCallingLoginApi.value = true;
    var responsee = await userlogin('Student');
      if (responsee.success == true) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(responsee.token!);

        // userDetails = decodedToken.entries.map( (entry) => Student(entry.key, entry.value)).toList();
        // print(userDetails);
        // decodedToken.map((value)=> Student.fromJson(json.decode(value)));
         userDetails = Student.fromJson(decodedToken);
        String encodedMap = jsonEncode(decodedToken);
        var sharepref = await SharedPreferences.getInstance();
        sharepref.setBool("LoginS", true);
        sharepref.setString('StudentDetails',encodedMap );
        sharepref.setString('email',responsee.email!);
        sharepref.setString('id',responsee.id!);
        sharepref.setString('name',responsee.name!);
        sharepref.setString('avatar',responsee.avatar!);
        sharepref.setBool('file',false);
        sharepref.setString('registrationNumber',responsee.registrationNumber!);
        sharepref.setString('department',responsee.department!);
        sharepref.setString('year',responsee.year!.toString());
        sharepref.setString('batch',responsee.batch!);
        print(responsee.avatar!);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
        Get.offAll(() => hidderDrawerScreen(usertype: "Student"));
        // Get.to( hidderDrawerScreen());
        isCallingLoginApi.value = false;
      }else{
        isCallingLoginApi.value = false;
      }
    }
  void loginAdmin () async{
    isCallingLoginApi.value = true;
    var responsee = await userlogin('Admin');
    if (responsee.success == true) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(responsee.token!);
      print(decodedToken);
      String encodedMap = jsonEncode(decodedToken);
      var sharepref = await SharedPreferences.getInstance();
      sharepref.setBool("LoginA", true);
      sharepref.setString('AdminDetails',encodedMap );
      sharepref.setString('email',responsee.email!);
      sharepref.setString('id',responsee.id!);
      sharepref.setBool('file',false);
      sharepref.setString('name',responsee.name!);
      sharepref.setString('avatar',responsee.avatar!);
      sharepref.setString('registrationNumber',responsee.registrationNumber!);
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      Get.offAll(() => hidderDrawerScreen(usertype: "Admin"));
      isCallingLoginApi.value = false;
    }else{
      isCallingLoginApi.value = false;
    }
  }
  void loginFaculty () async{
    isCallingLoginApi.value = true;
    var responsee = await userlogin('Faculty');
    if (responsee.success == true) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(responsee.token!);
      print(decodedToken);
      String encodedMap = jsonEncode(decodedToken);
      var sharepref = await SharedPreferences.getInstance();
      sharepref.setBool("LoginF", true);
      sharepref.setString('FacultyDetails',encodedMap );
      sharepref.setString('email',responsee.email!);
      sharepref.setString('id',responsee.id!);
      sharepref.setBool('file',false);
      sharepref.setString('name',responsee.name!);
      sharepref.setString('avatar',responsee.avatar!);
      sharepref.setString('registrationNumber',responsee.registrationNumber!);
      sharepref.setString('department',responsee.department!);
      // sharepref.setString('joiningYear',responsee.joiningYear!.toString());
      sharepref.setString('designation',responsee.designation!);
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      print(encodedMap);
      Get.offAll(() => hidderDrawerScreen(usertype: "Faculty"));
      isCallingLoginApi.value = false;
    }else{
      isCallingLoginApi.value = false;
    }
  }

}
