
import 'dart:async';
import 'package:collge_erp_app/bindings/AllControllerBinding.dart';
import 'package:collge_erp_app/router/navrouter.dart';
import 'package:collge_erp_app/router/navrouter_constants.dart';
import 'package:get/get.dart';
import 'package:collge_erp_app/view/Splashscreen.dart';
import 'package:collge_erp_app/view/drawerScreen.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:collge_erp_app/view/home.dart';
import 'package:collge_erp_app/view/homemain.dart';
import 'package:collge_erp_app/view/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: splashScreen,
      initialBinding: AllControllerBinding(),
      getPages: NavRouter.generateRoute,
      title: 'College ERP',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

