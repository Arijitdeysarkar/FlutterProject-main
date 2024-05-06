import 'package:collge_erp_app/controller/ExamFeePayController.dart';
import 'package:collge_erp_app/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeePayment extends StatefulWidget {
  const FeePayment({super.key});

  @override
  State<FeePayment> createState() => _FeePaymentState();
}

class _FeePaymentState extends State<FeePayment> {
  ExamFeePayController examPaymentFees = Get.find();
  String name = "";
  String registration = "";
  var _razorpay = Razorpay();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void getDetails() async {
    var sharepref = await SharedPreferences.getInstance();
    setState(() {
      registration = sharepref.getString('registrationNumber')!;
      name = sharepref.getString('name')!;
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    // print('sucess response ${response.data.toString()}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/abc.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       SizedBox(
                        height: 20,
                      ),
                      name != ""
                          ? Container(
                              width: fullWidth(context) * 0.8,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Text(
                                'Name : ${name.toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 16),
                              ))
                          : Text(''),
                      SizedBox(
                        height: 30,
                      ),
                      registration != ""
                          ? Container(
                              width: fullWidth(context) * 0.8,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Text(
                                'Registration : ${registration.toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 16),
                              ))
                          : Text(''),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            DropdownMenu(
                              width: fullWidth(context) * 0.8,
                              // menuHeight: 50,
                              onSelected: (ele) {
                                if (ele != null) {
                                  // giveAttendence.year.value = ele;
                                  print('ele ${ele}');
                                  examPaymentFees.examName.value = ele;
                                  examPaymentFees.examFees.value =
                                      examPaymentFees.examList
                                          .where((p0) => p0.exam == ele)
                                          .toList()[0]
                                          .fees
                                          .toString();
                                }
                              },
                              enableSearch: true,
                              initialSelection: 'Select Exam',
                              hintText: "Select Exam",
                              dropdownMenuEntries: examPaymentFees.examList
                                  .map<DropdownMenuEntry<String>>((element) {
                                return DropdownMenuEntry<String>(
                                  value: element.exam.toString(),
                                  label: element.exam.toString(),
                                  enabled: element.exam != 'Grey',
                                  style: MenuItemButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    textStyle: TextStyle(color: Colors.black,fontSize: 16)
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            examPaymentFees.examFees != ""
                                ? Container(
                                    width: fullWidth(context) * 0.8,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Text(
                                      'Exam Fees : ₹ ${examPaymentFees.examFees.toString()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16),
                                    ))
                                : Text(''),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: fullWidth(context) * 0.8,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (examPaymentFees.examFees != "") {
                                var options = {
                                  'key': 'rzp_test_nEWpO1FBzr1EqK',
                                  'amount': examPaymentFees.examFees != ""
                                      ? int.parse(examPaymentFees.examFees.toString())*100
                                      : 0,
                                  'name': '${examPaymentFees.examName.toString()}',
                                  'description': 'Semester Exam Fee Payment',
                                  'retry': {'enabled': true, 'max_count': 1},
                                  'send_sms_hash': true,
                                  'prefill': {
                                    'contact': '8888888888',
                                    'email': '9vQpU@example.com'
                                  },
                                };
                                _razorpay.open(options);
                              }
                              //  : Get.snackbar('Warming', 'PLease select any exam');
                            },
                            child: Text("Payment",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                    ]))));
  }
}
