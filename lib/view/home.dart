
import 'package:collge_erp_app/view/Splashscreen.dart';
import 'package:collge_erp_app/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // materialApp with debugbanner false
    return MaterialApp(
      // theme of the app
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      // scaffold with app
      home: Scaffold(
        // appbat sets the title of the app

        // Decoratedbox which takes the
        // decoration and child property
        body:DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/abcd.jpg"), fit: BoxFit.cover),
          ),
          child: Center(
              child:SingleChildScrollView(
                child: (
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text('Welcome To \nTechno College \nHooghly', style: TextStyle(color: Colors.black,fontSize: 28, fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: ()async{
                            // var sharepref = await SharedPreferences.getInstance();
                            // sharepref.setBool("LoginS", false);
                            // sharepref.setBool("LoginA", false);
                            // sharepref.setBool("LoginF", false);
                            // sharepref.setString('StudentDetails', '');
                            // sharepref.setString('AdminDetails', '');
                            // sharepref.setString('FacultyDetails', '');
                            // Get.to(SplashScreen());
                            Get.snackbar("Please visit our website to create new account", 'www.college.erp.com',isDismissible: true,);
                          },
                          child: Container(
                            height: 60,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyLoginPage()));
                          },
                          child: Container(
                            height: 60,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('Log In', style: TextStyle(color: Colors.white)),
                          ),
                        ),

                      ],
                    )
                ),
              )

          ),
        ),

      ),
    );
  }

}
