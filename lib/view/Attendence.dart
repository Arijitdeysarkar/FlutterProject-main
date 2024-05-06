import 'package:collge_erp_app/controller/attendenceController.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  AttendenceController attendenceController = Get.find();

  late List<dynamic> abc = [];
  late var sss = [];
  @override
  void initState () {
    super.initState();
    // attendenceController.getAttendenceList('64f46a15b2d0e12aac57e1ee');

    setState(() {
      attendenceController.attendencelist.map((element) => {
        [...abc,element]
      });
    });
    print(attendenceController.attendencelist.length);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:DecoratedBox(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/abc.jpeg"), fit: BoxFit.cover),
    ),

       child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // margin: Edge Insets.all(25),
                children:<Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    primary: false,
                    padding: const EdgeInsets.only(right: 8,left: 8),
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 20,
                    childAspectRatio: (1 / .4),
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 8, left: 5),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.teal[200],borderRadius:  BorderRadius.circular(0),
                            border:Border.all(width: 0.5)
                        ),
                        child: const Text("Subject",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.teal[300],borderRadius:  BorderRadius.circular(0),
                            border:Border.all(width: 0.5)
                        ),
                        child: const Text('Attended',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.teal[400],borderRadius:  BorderRadius.circular(0),
                            border:Border.all(width: 0.5)
                        ),
                        child: const Text('Total',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8, left: 5),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.teal[500],borderRadius:  BorderRadius.circular(0),
                            border:Border.all(width: 0.5)
                        ),
                        child: const Text('Attendence%',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: fullHeight(context),
                    child:  Obx(() =>  ListView.builder(itemBuilder: (BuildContext context,int index){

                      return
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: 40,
                              width: fullWidth(context)*0.24,
                              decoration: BoxDecoration(
                                  color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                  border:Border.all(width: 0.5)
                              ),
                              child:  Text(attendenceController.attendencelist[index].subjectName.toString()),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8,left: 30),
                              height: 40,
                              width: fullWidth(context)*0.24,
                              decoration: BoxDecoration(
                                  color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                  border:Border.all(width: 0.5)
                              ),
                              child:  Text( attendenceController.attendencelist[index].lectureAttended.toString()),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8,left: 30),
                              height: 40,
                              width: fullWidth(context)*0.24,
                              decoration: BoxDecoration(
                                  color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                  border:Border.all(width: 0.5)
                              ),
                              child:  Text(attendenceController.attendencelist[index].totalLecturesByFaculty.toString()),
                            ),
                            Container(
                              padding:  const EdgeInsets.only(top: 8,left: 30),
                              height: 40,
                              width: fullWidth(context)*0.24,
                              decoration: BoxDecoration(
                                  color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                  border:Border.all(width: 0.5)
                              ),
                              child:  Text(attendenceController.attendencelist[index].attendence.toString()),
                            ),
                          ]);

                    },itemCount: attendenceController.attendencelist.length),
                    )
                  )
                ])
        ),
        )



    );
  }
}
