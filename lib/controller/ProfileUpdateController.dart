
import 'dart:convert';
import 'dart:io';
import 'package:collge_erp_app/Provider/image_upload_provider.dart';
import 'package:collge_erp_app/const/app_url.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:collge_erp_app/view/mainHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
class ProfileUpdateController extends GetxController{
  var isImageSelected = false.obs;
  var showLoader = false.obs;
  var filePath = "".obs;
  var compressImagePath = ''.obs;
  late XFile compressfile;
  var compressImageSize = ''.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  final form = FormData({});
  String email = "";
  late File imageFile;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetails();
  }
  void getDetails () async{
    var sharepref =await  SharedPreferences.getInstance();
    email=sharepref.getString('email')!;
    // getAttendence(sharepref.getString('id')!);

  }
  Future selectImage() async {
    try {
      isImageSelected.value = false;
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
      selectedImagePath.value = image.path;
      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + "/temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          selectedImagePath.value,
          targetPath, quality: 90);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          "${((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2)} Mb";
compressfile = compressedFile;
        // filePath.value = image.path;
        // imageFile = File(image.path);
        // isImageSelected.value = true;
      // updateProfile(compressedFile as File);
        print("object");
        print(email);
        print(selectedImagePath.value);
      }
    } catch (err) {
      if (err.toString().contains("photo_access_denied")) {
        Get.showSnackbar(const GetSnackBar(
            message:
            "You haven't granted access to photos. Please grant access from settings",
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(bottom: 20, left: 0, right: 0)));
      }
    }
  }

  updateProfile()async{
    // if()
    showLoader.value = true;
    var sharepref = await SharedPreferences.getInstance();
    var isloggedin = sharepref.getBool('LoginS');
    var isloggedinAdmin = sharepref.getBool('LoginA');
    var isloggedinFaculty = sharepref.getBool('LoginF');
    print('file path ${selectedImagePath.value}');
    var uri = Uri.parse(AppUrls.profileUpdateUrl);
    var request = http.MultipartRequest("POST", uri);
    // request.headers.addAll({
    //   "Content-type": "application/json",
    // });
    request.fields['email'] = email;
    request.fields['gender'] = "Male";
    request.fields['studentMobileNumber'] = "78787878787";
    request.fields['aadharCard'] = "78787878787";

    // var pic = await http.MultipartFile.fromPath("avatar", compressImagePath.value);
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    'avatar', selectedImagePath.value, filename: 'image.png', contentType: MediaType('image', 'jpg')); 
    request.files.add(multipartFile);
    // form.files.add("email",email);
  
  
    // request.files.add(pic);
    http.StreamedResponse response = await request.send();
    // var responseString = await response.stream.bytesToString();
    print("sfrrreerererer");
    print(json.decode(await response.stream.bytesToString()));
    if(response.statusCode == 200){
      Get.snackbar('UpdatePrfile', 'Success' );
      showLoader.value = false;
      print("Upadate skjlsdhkjsdgk");
      var sharepref = await SharedPreferences.getInstance();
      sharepref.setString('avatar',selectedImagePath.value);
      sharepref.setBool('file',true);

      Get.snackbar('Update Profile', 'Successfull' );
      Get.to(()=>hidderDrawerScreen(usertype:  isloggedin! ? "Student" : isloggedinAdmin! ? "Admin" : "Faculty") );
    }else{
      showLoader.value = false;
      Get.snackbar('Update Profile', 'failed' );
    }
  }
  // void updateProfile(File file)async{
  //   // showLoader.value = true;
  //   print(file);
  //   ImageUploadProvider().uploadImage(file , email).then((resp){
  //     // showLoader.value=false;
  //     print(resp);

  //       Get.snackbar("Success","File Uploaded" ,
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white
  //       );

  //   },onError: (err){
  //     print(err);
  //     showLoader.value=false;
  //     Get.snackbar("error","File Upload failed" ,
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent,
  //         colorText: Colors.white
  //     );
  //   });
  // }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}