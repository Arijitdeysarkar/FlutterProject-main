import 'package:collge_erp_app/controller/subjectListController.dart';
import 'package:collge_erp_app/controller/subjectListController.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SubjectList extends StatefulWidget {
  const SubjectList({super.key});

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  SubjectListController subjectListController = Get.find();

  late List<dynamic> abc = [];
  late var sss = [];
  @override
  void initState () {
    super.initState();
    // subjectListController.getsubjectlist('64f46a15b2d0e12aac57e1ee');

    
    print(subjectListController.subjectlist.length);
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
                          padding: const EdgeInsets.only(top: 8, ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.teal[200],borderRadius:  BorderRadius.circular(0),
                              border:Border.all(width: 0.5)
                          ),
                          child: const Text("SubjectCode",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.teal[300],borderRadius:  BorderRadius.circular(0),
                              border:Border.all(width: 0.5)
                          ),
                          child: const Text('Subject',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.teal[400],borderRadius:  BorderRadius.circular(0),
                              border:Border.all(width: 0.5)
                          ),
                          child: const Text('Year',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.teal[500],borderRadius:  BorderRadius.circular(0),
                              border:Border.all(width: 0.5)
                          ),
                          child: const Text('TotalLecture',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
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
                                    child:  Text(subjectListController.subjectlist[index].subjectName.toString(),textAlign: TextAlign.center),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 8,),
                                    height: 40,
                                    width: fullWidth(context)*0.24,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                        border:Border.all(width: 0.5)
                                    ),
                                    child:  Text( subjectListController.subjectlist[index].subjectCode.toString(),textAlign: TextAlign.center),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 8),
                                    height: 40,
                                    width: fullWidth(context)*0.24,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                        border:Border.all(width: 0.5)
                                    ),
                                    child:  Text(subjectListController.subjectlist[index].year.toString(),textAlign: TextAlign.center),
                                  ),
                                  Container(
                                    padding:  const EdgeInsets.only(top: 8),
                                    height: 40,
                                    width: fullWidth(context)*0.24,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,borderRadius:  BorderRadius.circular(0),
                                        border:Border.all(width: 0.5)
                                    ),
                                    child:  Text(subjectListController.subjectlist[index].totalLectures.toString(),textAlign: TextAlign.center),
                                  ),
                                ]);

                        },itemCount: subjectListController.subjectlist.length),
                        )
                    )
                  ])
          ),
        )



    );
  }
}
