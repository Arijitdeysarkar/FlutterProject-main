import 'package:collge_erp_app/controller/logincontroller.dart';
import 'package:collge_erp_app/utils/utils.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:collge_erp_app/view/drawerScreen.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // tested with just a hot reload.
          primarySwatch: Colors.blue,
        ),
        home: MyLoginPage());
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyLoginPageState();
  }
}

class _MyLoginPageState extends State<MyLoginPage> {
  String userType = 'Admin';

  final loginController = Get.put(LoginController());

  String selected = 'Admin';
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Login"),
        ),
        body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/abc.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Container(
              width: fullWidth(context),
              height: fullHeight(context),
                child:
                SingleChildScrollView(
                  child: 
                 Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  //  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/LOGO.png',
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  height: 70,
                  // padding: const EdgeInsets.only(left: 1,right: 1),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'Admin';
                          });
                        },
                        child: Container(
                          width: 116,
                          height: 70,
                          // padding: const EdgeInsets.all(18),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected == 'Admin'
                                ? Colors.deepOrange
                                : Colors.white,
                            gradient: selected != 'Admin'
                                ? null
                                : const LinearGradient(
                                    colors: [
                                      Colors.black54,
                                      Colors.black,
                                      Colors.black,
                                      Colors.black,
                                      Colors.black,
                                      Colors.black,
                                      Colors.black54
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          child: selected == 'Admin'
                              ? const Text('Admin',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 21))
                              : const Text('Admin',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 21)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'Faculty';
                          });
                        },
                        child: Container(
                          width: 116,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: selected == 'Faculty'
                                  ? Colors.deepOrange
                                  : Colors.white,
                              gradient: selected != 'Faculty'
                                  ? null
                                  : const LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black54
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                              border: const Border(
                                right: BorderSide(
                                  //                   <--- right side
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                left: BorderSide(
                                  //                   <--- right side
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              )),
                          child: selected == 'Faculty'
                              ? const Text('Faculty',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 21))
                              : const Text('Faculty',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 21)),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'Student';
                            });
                          },
                          child: Container(
                            width: 116,
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selected == 'Student'
                                  ? Colors.deepOrange
                                  : Colors.white,
                              gradient: selected != 'Student'
                                  ? null
                                  : const LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black,
                                        Colors.black54
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: selected == 'Student'
                                ? const Text('Student',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 21))
                                : const Text('Student',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 21)),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(widget.title),
                      TextField(
                        controller: loginController.registrationController,
                        decoration: InputDecoration(
                          hintText: 'Enter Registration number',
                          // hintStyle: TextStyle(color: Colors.black),
                          labelText: 'Registration number',
                          focusColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black)),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          // prefixIcon: IconButton(
                          //    icon: Icon(Icons.message,color: Colors.lightGreen,),
                          //    onPressed: (){
                          //
                          //    },
                          //  )
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      TextField(
                        controller: loginController.passwordController,
                        obscureText: secure,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                          // hintStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black)),
                          suffixIcon: IconButton(
                            icon: secure
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.white,
                                  ),
                            onPressed: () {
                              setState(() {
                                secure ? secure = false : secure = true;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Obx(() {
                        return loginController.isCallingLoginApi.value
                            ? CircularProgressIndicator(color: Colors.black,)
                            : InkWell(
                                onTap: () async {
                                  if (loginController
                                      .registrationController.text.isEmpty) {
                                    Get.showSnackbar(const GetSnackBar(
                                        message: "please enter registration",
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: Duration(seconds: 2),
                                        margin: EdgeInsets.only(
                                            bottom: 5, left: 0, right: 0)));
                                  } else if (loginController
                                      .passwordController.text.isEmpty) {
                                    Get.showSnackbar(const GetSnackBar(
                                        message: "please enter password",
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: Duration(seconds: 2),
                                        margin: EdgeInsets.only(
                                            bottom: 5, left: 0, right: 0)));
                                  } else {
                                    if (selected == 'Admin') {
                                      loginController.loginAdmin();
                                    } else if (selected == 'Faculty') {
                                      loginController.loginFaculty();
                                    } else {
                                      loginController.login();
                                    }
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 0)),
                                  child: const Center(
                                    child: Text('Login',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17)),
                                  ),
                                ),
                              );
                      }),
                    ],
                  ),
                ),
              ],
            )))));
  }
}
