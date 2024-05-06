import 'package:collge_erp_app/model/getMessageModel.dart';
import 'package:collge_erp_app/model/sendMessageMod.dart';
import 'package:collge_erp_app/model/sendMessageModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, dynamic>> data = Get.arguments;
  bool isCallingApi = false;
  late String? selfId;
  late String? selfImg;
  late String? selfName;

  TextEditingController messageInputController = TextEditingController();
  late List<Result> _messages = [];
  late IO.Socket socket;
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
    socket = IO.io(
        'http://localhost:5000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            // .disableAutoConnect()
            .enableForceNewConnection()
            .setQuery({'timeStamp': DateTime.now().millisecondsSinceEpoch})
            .build());
    socket.connect();

    var roomdata = {
      "room1": data[1]["receiverRegistrationNumber"] +
          "." +
          data[2]["senderRegistrationNumber"],
      "room2": data[2]["senderRegistrationNumber"] +
          "." +
          data[1]["receiverRegistrationNumber"]
    };

    socket.emit('join room', roomdata);
    socket.on(
        "new Message",
        (data) => {
              setState(() {
                _messages.insert(0, Result.fromJson(data));
              })
            });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.emit('disconnect');
    socket.disconnect();
  }

  void getDetails() async {
    var sharepref = await SharedPreferences.getInstance();
    setState(() {
      selfId = sharepref.getString('id');
      selfImg = sharepref.getString('avatar');
      selfName = sharepref.getString('name');
    });
    getMsgList();
  }

  Future<getMessageModel> getMsgListApi() async {
    // CircularProgressIndicator()
    final result = await http
        .get(
          Uri.parse(
              "http://localhost:5000/api/student/chat/${data[1]["receiverRegistrationNumber"]}.${data[2]["senderRegistrationNumber"]}"),
        )
        .timeout(const Duration(seconds: 30));

    print("GetChatList details");
    print(result.body);
    print(result.statusCode);
    if (result.statusCode == 200) {
      // Get.snackbar('GetChatList', 'Success');
      isCallingApi = false;
      print("GetChatList skjlsdhkjsdgk");
      // attendencelist.ad
    } else {
      isCallingApi = false;
      Get.snackbar('GetChatList', 'failed');
    }
    return getMessageModel.fromJson(json.decode(result.body));
  }

  void getMsgList() async {
    isCallingApi = true;
    var responsee = await getMsgListApi();
    // var responsee2 = await getNewChatListApi(val);

    print("Attendence skjlsdhkjsdgk");
    print(responsee);
    if (responsee.result?.length != 0) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const hidderDrawerScreen()));
      setState(() {
        _messages.addAll(responsee.result as Iterable<Result>);
        _messages.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        isCallingApi = false;
      });
    } else {
      isCallingApi = false;
    }
  }

  Future<sendMessageModel> sendMsg() async {
    // CircularProgressIndicator()
    final model = sendMessageMod(
        roomId:
            "${data[1]["receiverRegistrationNumber"]}.${data[2]["senderRegistrationNumber"]}",
        senderName: selfName,
        senderId: selfId,
        message: messageInputController.text,
        senderRegistrationNumber: "${data[2]["senderRegistrationNumber"]}",
        receiverRegistrationNumber: "${data[1]["receiverRegistrationNumber"]}",
        image: selfImg);
    socket.emit("private message", {
      Result(
              roomId:
                  "${data[1]["receiverRegistrationNumber"]}.${data[2]["senderRegistrationNumber"]}",
              senderName: selfName,
              senderId: selfId,
              createdAt: DateTime.now().toString(),
              message: messageInputController.text,
              image: selfImg)
          .toJson()
    });
    // setState(() {
    //   _messages.insert(
    //       0,
    //       Result.fromJson(
    //          { "roomId":
    //           "${data[1]["receiverRegistrationNumber"]}.${data[2]["senderRegistrationNumber"]}",
    //           "senderName": selfName,
    //           "senderId": selfId,
    //           "createdAt": DateTime.now().toString(),
    //           "message": messageInputController.text,
    //           "image": selfImg}));
    // });
    messageInputController.clear();
    print("========Model");
    print(model.toJson());
    final result = await http
        .post(
          Uri.parse(
              "http://localhost:5000/api/student/chat/${data[1]["receiverRegistrationNumber"]}.${data[2]["senderRegistrationNumber"]}"),
          body: model.toJson(),
        )
        .timeout(const Duration(seconds: 30));

    print("GetChatList details");
    print(result.body);
    print(result.statusCode);
    if (result.statusCode == 200) {
      // Get.snackbar('GetChatList', 'Success');
      isCallingApi = false;
      print("GetChatList skjlsdhkjsdgk");
    } else {
      isCallingApi = false;
      Get.snackbar('Send Message', 'failed');
    }
    return sendMessageModel.fromJson(json.decode(result.body));
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.teal,
        title: Text(
          data[0]["receiverName"].toString().toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {},
        //   ),]
      ),
      // backgroundColor: Colors.white,
      body:DecoratedBox(
      decoration:  BoxDecoration(
      image: DecorationImage(
    image: AssetImage("assets/images/chatBack.webp"), fit: BoxFit.cover),
    ),
    child:Container(
        child: Column(
          children: [
            Expanded(
                // flex: 7,
                child: Container(
              // color: Colors.white,
              child: ListView.builder(
                  // shrinkWrap: true,
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return MessageItem(
                      myId: selfId ?? "",
                      messagee: _messages[index],
                    );
                  }),
            )),
            Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: messageInputController,
                    // cursorHeight: 20,
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        hintText: "Type message...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              sendMsg();
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ))
          ],
        ),
      ),
      ));
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.myId, required this.messagee});
  final String myId;
  final Result messagee;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: messagee.senderId == myId
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          // color: sentByMe ? Colors.black : Colors.amberAccent,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),
                  bottomLeft: messagee.senderId == myId ?Radius.circular(10):Radius.circular(0),bottomRight:messagee.senderId == myId ?Radius.circular(0):Radius.circular(10)),
              color: messagee.senderId == myId ? Colors.black : Colors.deepPurpleAccent),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                messagee.message.toString(),
                style: TextStyle(
                    fontSize: 18,
                    color: messagee.senderId == myId
                        ? Colors.white
                        : Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                DateFormat('yy-MM-dd kk:mm')
                    .format(DateTime.parse(messagee.createdAt!))
                    .toString(),
                // DateTime.parse(messagee.createdAt!).toString(),
                style: TextStyle(fontSize: 9, color:messagee.senderId == myId ? Color(0xff9a9a9a) : Colors.white) ,
              ),
            ],
          ),
        ));
  }
}
