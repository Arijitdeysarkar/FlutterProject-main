import 'package:collge_erp_app/controller/ChatListController.dart';
import 'package:collge_erp_app/view/ChatPage.dart';
import 'package:collge_erp_app/view/SearchChatList.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  // TextEditingController searchInputController = TextEditingController();
  ChatListController chatListController = Get.put(ChatListController());
  String selected = 'New Chat' ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
      
    // chatListController.chatlist.toSet().toList();
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/abc.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Container(
                    // alignment: Alignment.center,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent),
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        controller: chatListController.searchInputController,
                        // cursorHeight: 20,
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          decorationThickness: 0,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.2)),
                            hintText: "Search Students",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            suffixIcon: Container(
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: chatListController.isCallingApi.value
                                  ? const SizedBox(
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.white,
                                      )),
                                      height: 10.0,
                                      width: 10.0,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        chatListController
                                            .getStudentByNameList();
                                        // Get.to(SearchChatListPage(),transition: Transition.rightToLeft);
                                      },
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                            )),
                      ),
                    )),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap :(){
                        setState(() {
                          selected = 'New Chat';
                        });
                      },
                      child: Container(
                        width: fullWidth(context) * 0.475,
                        height: 60, 
                        alignment: Alignment.center,
                        // padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:selected == 'New Chat' ? Colors.deepOrange : Colors.white,
                          gradient:selected != 'New Chat' ? null : const LinearGradient(
                            colors: [Colors.black54,Colors.black,Colors.black,Colors.black,Colors.black,
                              Colors.black,Colors.black54],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),

                          borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),

                        ),
                        child: selected == 'New Chat' ?   const Text('New Chat', style: TextStyle(color: Colors.white ,fontSize: 19)) :
                        const Text('New Chat', style: TextStyle(color: Colors.black ,fontSize: 19))
                        ,

                      )
                      ,) 

                 ,
                
                  GestureDetector(
                      onTap :(){
                        setState(() {
                          selected = 'Previous Chat';
                        });
                      },
                      child:  Container(
                        width: fullWidth(context) * 0.475,
                        height: 60,
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                            color:selected == 'Previous Chat' ? Colors.deepOrange : Colors.white,
                          gradient:selected != 'Previous Chat' ? null : const LinearGradient(
                            colors: [Colors.black54,Colors.black,Colors.black,Colors.black,Colors.black,
                              Colors.black,Colors.black54],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                            borderRadius:const BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) ),

                        ),
                        child:  selected == 'Previous Chat' ?   const Text('Previous Chat', style: TextStyle(color: Colors.white ,fontSize: 19)) :
                        const Text('Previous Chat', style: TextStyle(color: Colors.black ,fontSize: 19)),

                      )
                  )
                ],
            ),
            SizedBox(height: 5,),
               Obx(() =>  Expanded(
                  child: ListView.builder(
                      itemCount: selected == 'New Chat' ? chatListController.chatlistNew.length : chatListController.chatlist.length,
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
                            title: Text(selected == 'New Chat' ? chatListController
                                .chatlistNew[index].receiverName.toString() : chatListController
                                .chatlistNew[index].receiverName.toString()),
                            subtitle: Text(selected == 'New Chat' ? chatListController
                                .chatlistNew[index].receiverRegistrationNumber.toString() : chatListController
                                .chatlistNew[index].receiverRegistrationNumber.toString()),
                            tileColor: Colors.white,
                            leading: Icon(Icons.person),
                            onTap: () {
                              Get.to(ChatPage(),
                                  arguments: [
                                    {
                                      "receiverName":selected == 'New Chat' ? chatListController.chatlistNew[index].receiverName : chatListController.chatlist[index].receiverName},
                                      {
                                      "receiverRegistrationNumber":selected == 'New Chat' ? chatListController.chatlistNew[index].receiverRegistrationNumber : chatListController.chatlist[index].receiverRegistrationNumber
                                      },
                                      {
                                      "senderRegistrationNumber":selected == 'New Chat' ? chatListController.chatlistNew[index].senderRegistrationNumber : chatListController.chatlist[index].senderRegistrationNumber
                                      }
                                  ],
                                  transition: Transition.rightToLeft);
                            },
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        );
                      }),
                ))
              ],
            ))));
  }
}
