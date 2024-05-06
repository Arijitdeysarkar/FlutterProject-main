import 'dart:async';
import 'dart:convert';

import 'package:collge_erp_app/view/drawerScreen.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:collge_erp_app/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState () {
    super.initState();
    wheretogo();
  }

  void wheretogo () async{
    var sharepref = await SharedPreferences.getInstance();
    var isloggedin = sharepref.getBool('LoginS');
    var isloggedinAdmin = sharepref.getBool('LoginA');
    var isloggedinFaculty = sharepref.getBool('LoginF');
    dynamic details =sharepref.getString('name');


    print(isloggedin );
    Timer(const Duration(seconds:2), () {
      if(isloggedin!= null || isloggedinAdmin!= null || isloggedinFaculty!= null || details != null){
        if(isloggedin! || isloggedinAdmin! || isloggedinFaculty!){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> 
           hidderDrawerScreen(usertype:  isloggedin ? "Student" : isloggedinAdmin! ? "Admin" : "Faculty") ));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homePage()));
        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homePage()));

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: fullWidth(context) * 0.65,
          height: fullHeight(context) * .25,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LOGO.png'), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
