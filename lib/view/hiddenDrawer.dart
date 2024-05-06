
import 'package:collge_erp_app/view/Attendence.dart';
import 'package:collge_erp_app/view/ChatListPage.dart';
import 'package:collge_erp_app/view/Faculty/GiveAttendence.dart';
import 'package:collge_erp_app/view/FeesPayment.dart';
import 'package:collge_erp_app/view/SubjectList.dart';
import 'package:collge_erp_app/view/home.dart';
import 'package:collge_erp_app/view/login.dart';
import 'package:collge_erp_app/view/mainHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hidderDrawerScreen extends StatefulWidget {
  var usertype;

   hidderDrawerScreen({super.key, required this.usertype});

  @override
  State<hidderDrawerScreen> createState() => _hidderDrawerScreenState();
}

class _hidderDrawerScreenState extends State<hidderDrawerScreen> {
  List<ScreenHiddenDrawer> _pages = [];
  late String name = "";
  late String userType = "";
  late String userImg = "";

  @override
void initState() {
  super.initState();
  // getDetails();
  // setState(() {
    
  // _pages =  [
  //       ScreenHiddenDrawer(ItemHiddenMenu(
  //         name: "Homepage",
  //         baseStyle: TextStyle(color: Colors.white, fontSize: 18),
  //         selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
  //       ), MyCalculator(title: 'yooooo',)),
  //       ScreenHiddenDrawer(ItemHiddenMenu(
  //           name: "Attendence",
  //           baseStyle: TextStyle(color: Colors.white, fontSize: 18),
  //           selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
  //       ), AttendancePage()),
  //       ScreenHiddenDrawer(ItemHiddenMenu(
  //           name: "Subjects",
  //           baseStyle: TextStyle(color: Colors.white, fontSize: 18),
  //           selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
  //       ), SubjectList()),
  //     ];
  // });
  // getDetails().then((result) {
    setState(() {
      _pages = widget.usertype == "Faculty" ? [
        ScreenHiddenDrawer(ItemHiddenMenu(
          name: "Homepage",
          baseStyle: TextStyle(color: Colors.white, fontSize: 18),
          selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), MyCalculator(title: 'yooooo',)),
        ScreenHiddenDrawer(ItemHiddenMenu(
            name: "MarkAttendence",
            baseStyle: TextStyle(color: Colors.white, fontSize: 18),
            selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), GiveAttendence()),
      ] : (widget.usertype == "Admin" ? [
        ScreenHiddenDrawer(ItemHiddenMenu(
          name: "Homepage",
          baseStyle: TextStyle(color: Colors.white, fontSize: 18),
          selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), MyCalculator(title: 'yooooo',)),
      ] : [
        ScreenHiddenDrawer(ItemHiddenMenu(
          name: "Homepage",
          baseStyle: TextStyle(color: Colors.white, fontSize: 18),
          selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), MyCalculator(title: 'yooooo',)),
        ScreenHiddenDrawer(ItemHiddenMenu(
            name: "Subjects",
            baseStyle: TextStyle(color: Colors.white, fontSize: 18),
            selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), SubjectList()),
        ScreenHiddenDrawer(ItemHiddenMenu(
            name: "Attendence",
            baseStyle: TextStyle(color: Colors.white, fontSize: 18),
            selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), AttendancePage()),
          ScreenHiddenDrawer(ItemHiddenMenu(
            name: "Chat",
            baseStyle: TextStyle(color: Colors.white, fontSize: 18),
            selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), ChatListPage()),
         ScreenHiddenDrawer(ItemHiddenMenu(
            name: "Fees Payment",
            baseStyle: TextStyle(color: Colors.white, fontSize: 18),
            selectedStyle: TextStyle(color: Colors.black, fontSize: 18),
        ), FeePayment()),
      ]);
    });
  // });
}
  
  Future<String> getDetails () async{
    var sharepref =await  SharedPreferences.getInstance();
    setState(() {
      name = sharepref.getString('name')!;
      userImg = sharepref.getString('avatar')!;
      // userType = sharepref.getBool('LoginF')! ? "Faculty" : (sharepref.getBool('LoginA')! ? "Admin" : "Student");
      
    });
    return sharepref.getBool('LoginF')! ? "Faculty" : (sharepref.getBool('LoginA')! ? "Admin" : "Student");
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(screens: _pages, backgroundColorMenu: Colors.amber,slidePercent: 50,backgroundColorContent:Colors.red,
    styleAutoTittleName: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),actionsAppBar: [
      // Text("$name"),
       Container(
         margin: EdgeInsets.only(right: 12),
         decoration: BoxDecoration(
           border: Border.all(),
           borderRadius: BorderRadius.circular(100)
         ),
         child:   ClipRRect(
           borderRadius: BorderRadius.circular(80),
           child: Image.asset(
             'assets/images/LOGO.png',
             height: 40,
             width: 40,
             fit: BoxFit.contain,

           ),
         ),
       )

      ],
    // tittleAppBar: Container(height: 100,width: 100,decoration: BoxDecoration(color: Colors.cyanAccent)),
      isDraggable: true,);
  }
}
