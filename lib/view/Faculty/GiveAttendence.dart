 import 'package:collge_erp_app/controller/giveAttendenceController.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GiveAttendence extends StatefulWidget {
  const GiveAttendence({super.key});

  @override
  State<GiveAttendence> createState() => _GiveAttendenceState();
}

class _GiveAttendenceState extends State<GiveAttendence> {
  giveAttendenceController giveAttendence = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      
    print('sdsdsdsd ${giveAttendence.StudentList}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/abc.jpeg"), fit: BoxFit.cover),
        ),
        child: Obx(()=> SizedBox(
            width: fullWidth(context),
            child: giveAttendence.StudentList.isNotEmpty
                ?
                Column(
                    children: [
                       const SizedBox(
                        height: 20,
                      ),
                       DropdownMenu(
                        width: fullWidth(context)*0.9,
                        onSelected: (ele) {
                          if (ele != null) {
                            giveAttendence.selectedSubject.value = ele;
                          }
                        },
                        enableSearch: true,
                        initialSelection: 'Select subjectCode',
                        hintText: "Select Subject Code",
                        dropdownMenuEntries:
                            giveAttendence.subjectCode.map<DropdownMenuEntry<String>>(
                                (element) {
                          return DropdownMenuEntry<String>(
                            value: element,
                            label: element,
                            enabled: element != 'Grey',
                            style: MenuItemButton.styleFrom(
                              foregroundColor: Colors.grey,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: fullHeight(context)*0.5,
                        child:  ListView.builder(itemBuilder: (BuildContext context,int index){
                          return Obx(() =>  CheckboxListTile(
                              value: giveAttendence.selectedStudent.contains(giveAttendence.StudentList[index].sId!),
                              onChanged: (value){
                                giveAttendence.selectedStudent.contains(giveAttendence.StudentList[index].sId!) ?
                                    giveAttendence.selectedStudent.remove(giveAttendence.StudentList[index].sId!) :
                                    giveAttendence.selectedStudent.add(giveAttendence.StudentList[index].sId!) ;
                                print(giveAttendence.selectedStudent);
                              },
                            title:  Text(giveAttendence.StudentList[index].name.toString(),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            subtitle: Text(giveAttendence.StudentList[index].registrationNumber.toString(),style: const TextStyle(fontWeight: FontWeight.w400),),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.black,
                            checkColor: Colors.white,
                          ));
                        },itemCount:giveAttendence.StudentList.length),
                      ),
                       const SizedBox(
                        height: 20,
                      ),
                       GestureDetector(
                        onTap: () async {
                          if (giveAttendence.selectedSubject.value == "") {
                            Get.snackbar('warning', 'Please select any subject',snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
                          } else if (giveAttendence.selectedStudent.isEmpty) {
                            Get.snackbar(
                                'warning', 'Please select student',snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
                          } else {
                            giveAttendence
                                .markedAttendence();
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text('Mark Attendance',
                              style: TextStyle(color: Colors.black)),
                        ),
                      )
                    ],
                    
                  )
                  :
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),

                      Container(
                        width: fullWidth(context) * 0.8,
                        height: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.circular(5),
                          // color: Colors.white,
                        ),
                        child:  Text('Department : ${giveAttendence.Dept.toString()}',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 19),),
                      ),
                      SizedBox(height: 20,),
                     
                      DropdownMenu(
                        width: fullWidth(context) * 0.8,
                        onSelected: (ele) {
                          if (ele != null) {
                            giveAttendence.year.value = ele;
                          }
                        },
                        enableSearch: true,
                        initialSelection: 'Select year',
                        hintText: "Select year",
                        dropdownMenuEntries:
                            giveAttendence.Years.map<DropdownMenuEntry<String>>(
                                (element) {
                          return DropdownMenuEntry<String>(
                            value: element,
                            label: element,
                            enabled: element != 'Grey',
                            style: MenuItemButton.styleFrom(
                              foregroundColor: Colors.grey,
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20,),
                      DropdownMenu(
                        width: fullWidth(context) * 0.8,
                        onSelected: (ele) {
                          if (ele != null) {
                            giveAttendence.section.value = ele;
                          }
                        },
                        enableSearch: true,
                        initialSelection: 'Select section',
                        hintText: "Select section",
                        dropdownMenuEntries: giveAttendence.Sections.map<
                            DropdownMenuEntry<String>>((element) {
                          return DropdownMenuEntry<String>(
                            value: element,
                            label: element,
                            enabled: element != 'Grey',
                            style: MenuItemButton.styleFrom(
                              foregroundColor: Colors.grey,
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 25,),

                      GestureDetector(
                        onTap: () async {
                          if (giveAttendence.year.value == "") {
                            Get.snackbar('warning', 'Please select any year');
                          } else if (giveAttendence.section.value == "") {
                            Get.snackbar(
                                'warning', 'Please select any section');
                          } else {
                            giveAttendence
                                .getStudent(giveAttendence.Dept.value);
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text('Search Student',
                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)),
                        ),
                      )
                    ],
                  )
                
      ),
    )));
  }
}
