import 'package:collge_erp_app/controller/ChatListController.dart';
import 'package:collge_erp_app/view/ChatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchChatListPage extends StatefulWidget {
  const SearchChatListPage({super.key});

  @override
  State<SearchChatListPage> createState() => _SearchChatListPageState();
}

class _SearchChatListPageState extends State<SearchChatListPage> {
  // TextEditingController searchInputController = TextEditingController();
  ChatListController chatListController = Get.find();
  late String? registrationNumberself ;
    void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
    // print('dattatat>>>>>>$data');
  
  }
 void getDetails () async{
    var sharepref =await  SharedPreferences.getInstance();
    setState(() {
      
    registrationNumberself = sharepref.getString('registrationNumber');
    });
    // getMsgList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Student List")),
        body:Obx(() =>  DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/abc.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: chatListController.searchStulist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          shadowColor: Colors.grey.shade100,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          elevation: 5,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            title: Text(chatListController.searchStulist[index].name.toString()),
                            subtitle: Text(chatListController.searchStulist[index].department.toString()),
                            tileColor: Colors.white,
                            leading:  ClipRRect(
                   borderRadius: BorderRadius.circular(80),
                   child: Image.network(
                     chatListController.searchStulist[index].avatar!= "" ? chatListController.searchStulist[index].avatar.toString() :  'https://cdn4.vectorstock.com/i/1000x1000/72/23/download-sign-on-transparent-background-load-vector-14117223.jpg',
                     height: 50,
                     width: 50,
                     fit: BoxFit.cover,

                   ),
                 ),
                            onTap: () {
                              Get.to(ChatPage(),
                                  arguments: [
                                    {
                                      "receiverName": chatListController.searchStulist[index].name},
                                      {
                                      "receiverRegistrationNumber": chatListController.searchStulist[index].registrationNumber
                                      },
                                      {
                                      "senderRegistrationNumber": registrationNumberself
                                      }
                                  ],
                                  transition: Transition.rightToLeft);
                            },
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        );
                      }),
                )
              ],
            ))));
  }
}
