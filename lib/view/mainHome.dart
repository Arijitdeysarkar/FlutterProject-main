
import 'dart:io';

import 'package:collge_erp_app/router/navrouter_constants.dart';
import 'package:collge_erp_app/view/Splashscreen.dart';
import 'package:collge_erp_app/view/editProfile.dart';
import 'package:collge_erp_app/view/home.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Logic',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // tested with just a hot reload.
         primarySwatch: Colors.deepOrange,
        ),
        home:  MyCalculator(title: 'Flutter Demo Logic ')
    );
  }
}
class MyCalculator extends StatefulWidget{
 var title;

   MyCalculator({super.key,  required this.title});
  @override
  State<StatefulWidget> createState() {
    return _MyCalculatorPageState();
  }

}

class _MyCalculatorPageState extends State<MyCalculator>{
  var list =[];
  var details=[];
  var listF = [];
  var detailsF= [];
  var count = 0;
  @override
  void initState () {
    super.initState();
    getDetails();

  }

  late String name = "";
 late String userImg = "";
 late bool LoginF = false;
  late bool LoginA = false;
  late String userdata = "";
  late bool type = false;
  void getDetails () async{
    var sharepref =await  SharedPreferences.getInstance();
    setState(() {
      userImg = sharepref.getString('avatar') ?? "";
      type = sharepref.getBool('file')!;
      LoginF = sharepref.getBool("LoginF") ?? false;
      LoginA = sharepref.getBool("LoginA ") ?? false;
      if(LoginF){
        list = ["Registration","Name","FacultyId","Email","department","designation"];
        details = [sharepref.getString('registrationNumber')!,sharepref.getString('name')!,
          sharepref.getString('id')!,sharepref.getString('email')!,sharepref.getString('department')!,
          sharepref.getString('designation')!
        ];
      }else if(LoginA){
        list = ["Registration","Name","AdminId","Email"];
        details = [sharepref.getString('registrationNumber')!,sharepref.getString('name')!,
          sharepref.getString('id')!,sharepref.getString('email')!];
      }
      else{
        list = ["Registration","Name","StudentId","Email","department","Year","Batch"];
        details = [sharepref.getString('registrationNumber')!,sharepref.getString('name')!,
          sharepref.getString('id')!,sharepref.getString('email')!,sharepref.getString('department')!,
          sharepref.getString('year')!,sharepref.getString('batch')!];
      }




    });



  }
 var emailText = TextEditingController();
 var passText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:DecoratedBox(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/abc.jpeg"), fit: BoxFit.cover),
    ),
       child:SingleChildScrollView(
         child:  Container(
           width: fullWidth(context),
           height: fullHeight(context),
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               // mainAxisAlignment: MainAxisAlignment.center,
               children: [
                //  childClass(onClick: ()=>setState(() {
                //    count = count +1;
                //  }),Count: count),

                 const SizedBox(
                   height: 25,
                 ),

                 ClipRRect(
                   borderRadius: BorderRadius.circular(80),
                   child:
                       type ?
                   Image.file(
                     File( userImg)
                         .absolute,
                     height: 120,
                     width: 120,
                     fit: BoxFit.cover,
                   )
                       :
                   Image.network(
                     userImg!= "" ? userImg.toString() :  'https://cdn4.vectorstock.com/i/1000x1000/72/23/download-sign-on-transparent-background-load-vector-14117223.jpg',
                     height: 120,
                     width: 120,
                     fit: BoxFit.cover,

                   ),
                 ),
                 const SizedBox(
                   height: 10,
                 ),
                //  Text(details[1].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                 const SizedBox(
                   height: 20,
                 ),
                 SizedBox(
                   height: 350,
                   child:  ListView.builder(itemBuilder: (BuildContext context,int index){

                     return
                       Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                               padding: const EdgeInsets.all(12),
                               height: 50,
                               width: fullWidth(context)*0.3,
                               decoration: BoxDecoration(
                                   color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                   border:Border.all(width: 0.5)
                               ),

                               child:  Text(list[index].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                             ),
                             Container(
                               padding: const EdgeInsets.only(top: 12,left: 10),
                               height: 50,
                               width: fullWidth(context)*0.56,
                               decoration: BoxDecoration(
                                   color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                   border:Border.all(width: 0.5)
                               ),
                               child:  Text(details[index].toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                             ),

                           ]);

                   },itemCount:list.length),
                 ),

                 // Text("Welcome $name",style: const TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w700)),

                 // const Text('Welcome To \nTechno College \nHooghly', style: TextStyle(color: Colors.black,fontSize: 28, fontWeight: FontWeight.w700)),
                 const SizedBox(
                   height: 30,
                 ),
                 GestureDetector(
                   onTap: ()async{

                    Get.to(()=> EditProfile());
                    //  Get.to(const EditProfile());
                   },
                   child: Container(
                     height: 60,
                     width: 200,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                         color: Colors.white,borderRadius: BorderRadius.circular(10)
                     ),
                     child: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
                   ),
                 ),

                 const SizedBox(
                   height: 20,
                 ),
                 GestureDetector(
                   onTap: ()async{
                     var sharepref = await SharedPreferences.getInstance();
                     sharepref.setBool("LoginS", false);
                     sharepref.setBool("LoginA", false);
                     sharepref.setBool("LoginF", false);
                     sharepref.setString('StudentDetails', '');
                     sharepref.setString('AdminDetails', '');
                     sharepref.setString('FacultyDetails', '');
                     sharepref.setString('email','');
                     sharepref.setString('id','');
                     sharepref.setString('name','');
                     sharepref.setString('avatar','');
                     sharepref.setString('registrationNumber','');
                     sharepref.setString('department','');
                     sharepref.setString('year','');
                     sharepref.setString('batch','');
                     Get.offAll( SplashScreen());
                    //  Get.deleteAll();
                   },
                   child: Container(
                     height: 60,
                     width: 200,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                         color: Colors.white,borderRadius: BorderRadius.circular(10)
                     ),
                     child: const Text('Log Out', style: TextStyle(color: Colors.black)),
                   ),
                 ),



               ]),
         ),

       )


    ));
  }
}

class childClass extends StatelessWidget {
  var onClick;

  var Count;

  childClass({super.key,required this.onClick,required this.Count});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(onPressed: onClick, icon:   const Icon(
            Icons.plus_one,
            color: Colors.black,
            size: 15.0,
          ),),
          Text(Count.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
