// import 'dart:convert';

// import 'package:collge_erp_app/Service/Network/basic_api_service.dart';
// import 'package:collge_erp_app/Service/Network/network_api_service.dart';
// import 'package:collge_erp_app/const/app_url.dart';
// import 'package:collge_erp_app/model/loginModel.dart';
// import 'package:collge_erp_app/model/loginResponseModel.dart';
// import 'package:collge_erp_app/view/hiddenDrawer.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class SignupController extends GetxController{
//   TextEditingController registrationController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   var isCallingLoginApi = false.obs;
//   List<String> userDetails = [];
//   @override
//   onInit(){
//     super.onInit();
//   }
//   @override
//   void dispose() {
//     registrationController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   Future<LoginResponse> userlogin(String type) async{
//     // CircularProgressIndicator()
//     BasicApiService service = NetworkApiService();
//     final model = LoginModel(
//         registrationNumber: registrationController.text.trim(),
//         password: passwordController.text.trim());

//     print("========Model");
//     print(model.toJson());

//     // var result = await service.postApiResponse(
//     //    AppUrls.loginUrl,
//     //    METHOD.POST,
//     //    model.toJson()
//     // );
//     final result = await http.post(
//         Uri.parse(type == 'Student' ? AppUrls.loginUrl : type == 'Admin' ? AppUrls.adminloginUrl : AppUrls.facultyloginUrl),
//         body: model.toJson()
//     ).timeout(const Duration(seconds: 30));
//     print("Login details");
//     print(result.body);
//     print(result.statusCode);
//     if(result.statusCode == 200){
//       Get.snackbar('Login', 'Success' );
//       isCallingLoginApi.value = false;
//       registrationController.clear();
//       passwordController.clear();
//     }else{
//       isCallingLoginApi.value = false;
//       Get.snackbar('Login', 'failed' );
//     }
//     return LoginResponse.fromJson(json.decode(result.body));



//   }
//   void login () async{
//     isCallingLoginApi.value = true;
//     var responsee = await userlogin('Student');
//     if (responsee.success!) {
//       Map<String, dynamic> decodedToken = JwtDecoder.decode(responsee.token!);
//       print(decodedToken);
//       // userDetails = mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
//       String encodedMap = jsonEncode(decodedToken);
//       var sharepref = await SharedPreferences.getInstance();
//       sharepref.setBool("LoginS", true);
//       sharepref.setString('StudentDetails',encodedMap );
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
//       Get.to( hidderDrawerScreen());
//       isCallingLoginApi.value = false;
//     }else{
//       isCallingLoginApi.value = false;
//     }
//   }
//   void loginAdmin () async{
//     isCallingLoginApi.value = true;
//     var responsee = await userlogin('Admin');
//     if (responsee.success!) {
//       Map<String, dynamic> decodedToken = JwtDecoder.decode(responsee.token!);
//       print(decodedToken);
//       String encodedMap = jsonEncode(decodedToken);
//       var sharepref = await SharedPreferences.getInstance();
//       sharepref.setBool("LoginA", true);
//       sharepref.setString('AdminDetails',encodedMap );
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
//       Get.to( hidderDrawerScreen());
//       isCallingLoginApi.value = false;
//     }else{
//       isCallingLoginApi.value = false;
//     }
//   }
//   void loginFaculty () async{
//     isCallingLoginApi.value = true;
//     var responsee = await userlogin('Faculty');
//     if (responsee.success!) {
//       Map<String, dynamic> decodedToken = JwtDecoder.decode(responsee.token!);
//       print(decodedToken);
//       String encodedMap = jsonEncode(decodedToken);
//       var sharepref = await SharedPreferences.getInstance();
//       sharepref.setBool("LoginF", true);
//       sharepref.setString('FacultyDetails',encodedMap );
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
//       Get.to( hidderDrawerScreen());
//       isCallingLoginApi.value = false;
//     }else{
//       isCallingLoginApi.value = false;
//     }
//   }

// }
