import 'package:collge_erp_app/view/Attendence.dart';
import 'package:collge_erp_app/view/ChatPage.dart';
import 'package:collge_erp_app/view/Faculty/GiveAttendence.dart';
import 'package:collge_erp_app/view/SearchChatList.dart';
import 'package:collge_erp_app/view/Splashscreen.dart';
import 'package:collge_erp_app/view/editProfile.dart';
import 'package:collge_erp_app/view/hiddenDrawer.dart';
import 'package:collge_erp_app/view/home.dart';
import 'package:collge_erp_app/view/login.dart';
import 'package:collge_erp_app/view/mainHome.dart';
import 'package:get/get.dart';



import 'navrouter_constants.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(name: login, page: () => const MyLoginPage()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: home, page: () => homePage()),
    GetPage(name: mainhome, page: () =>  MyCalculator(title: 'home',)),

    GetPage(name: hiddenDrawer, page: () =>  hidderDrawerScreen(usertype: "",)),
    GetPage(name: attendence, page: () => const AttendancePage()),
    GetPage(name: editProfile, page: () => const EditProfile()),
    GetPage(name: giveAttendence, page: () => const GiveAttendence()),
    GetPage(name: chatPage, page: () => const ChatPage()),
    GetPage(name: searchchatPage, page: () => const SearchChatListPage()),


  ];
}
