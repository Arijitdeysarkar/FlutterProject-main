
import 'dart:io';

import 'package:collge_erp_app/controller/ProfileUpdateController.dart';
import 'package:collge_erp_app/view/Splashscreen.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  // final void Function(String) onClick;
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileUpdateController editProfileController = Get.put(ProfileUpdateController());
  // ProfileUpdateController editProfileController = Get.find();
  var list = [];


  var details = [];
  @override
  void initState() {
    super.initState();
    getDetails();


  }

  late String name = "";
  late String userImg = "";
  late bool LoginF = false;
  late bool type = false;
  void getDetails() async {
    var sharepref = await SharedPreferences.getInstance();
    setState(() {
      userImg = sharepref.getString('avatar')!;
      type = sharepref.getBool('file')!;
      LoginF = sharepref.getBool("LoginF") ?? sharepref.getBool('LoginF') ?? false;
      if(LoginF){
        list = ["Registration","Name","FacultyId","Email","department","designation"];
        details = [sharepref.getString('registrationNumber')!,sharepref.getString('name')!,
          sharepref.getString('id')!,sharepref.getString('email')!,sharepref.getString('department')!,
          sharepref.getString('designation')!
        ];
      }else{
        list = ["Registration","Name","StudentId","Email","department","Year","Batch"];
        details = [sharepref.getString('registrationNumber')!,sharepref.getString('name')!,
          sharepref.getString('id')!,sharepref.getString('email')!,sharepref.getString('department')!,
          sharepref.getString('year')!,sharepref.getString('batch')!];
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: editProfileController.showLoader.value,
        child: Scaffold(
            appBar: AppBar(
              // TRY THIS: Try changing the color here to a specific color (to
              // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
              // change color while the other colors stay the same.
              backgroundColor: Colors.white,
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: const Text("Update Profile"),
            ),
            body: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/abc.jpeg"),
                    fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                  child: Container(
                width: fullWidth(context),
                height: fullHeight(context),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Obx(
                                () => editProfileController.compressImagePath.value != ""  || type
                                    ? Image.file(
                                        File(editProfileController.compressImagePath.value != ""  ? editProfileController
                                                .selectedImagePath.value : userImg)
                                            .absolute,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        userImg != ""
                                            ? userImg.toString()
                                            : 'https://cdn4.vectorstock.com/i/1000x1000/72/23/download-sign-on-transparent-background-load-vector-14117223.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                              )),
                          Positioned(
                              bottom: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  editProfileController.selectImage();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   details[1].toString()??" ",
                      //   style: const TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 20),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      height: 50,
                                      width: fullWidth(context) * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(width: 0.5)),
                                      child: Text(
                                        list[index].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 12, left: 10),
                                      height: 50,
                                      width: fullWidth(context) * 0.55,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(width: 0.5)),
                                      child: Text(details[index].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ]);
                            },
                            itemCount: list.length),
                      ),

                      // Text("Welcome $name",style: const TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w700)),

                      // const Text('Welcome To \nTechno College \nHooghly', style: TextStyle(color: Colors.black,fontSize: 28, fontWeight: FontWeight.w700)),

                      const SizedBox(
                        height: 40,
                      ),
                      Obx(() {
                        return editProfileController.showLoader.value
                            ? const CircularProgressIndicator()
                            :
                        GestureDetector(
                          onTap: () async {
                            if (editProfileController.selectedImagePath.value != "") {
                              print("sdsd");
                              editProfileController.updateProfile();
                            } else {
                              Get.snackbar("Nothing has changed", "warning");
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text('Update',
                                style: TextStyle(color: Colors.black)),
                          ),
                        );
                      })]),
              )),
            )));
  }
}
