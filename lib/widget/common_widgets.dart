import 'dart:math';

import 'package:collge_erp_app/const/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

OutlineInputBorder customOutlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.redAccent,
      width: 1.5,
    ),
  );
}

///text-Regular
Widget textRegular({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
  dynamic alignment,
}) {
  return Text(
    text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    textAlign: alignment ?? TextAlign.left,
  );
}

///text-Bold Style
Widget textBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Thin Style
Widget textThin({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    maxLines: 20,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Extra Light Style
Widget textExtraLight({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    maxLines: 1,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.w200,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text- Light Style
Widget textLight({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Medium Style
Widget textMedium({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Semi Bold Style
Widget textSemiBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
  dynamic alignment,
}) {
  return Text(
    text,
    maxLines: maxLine,
    textAlign: alignment ?? TextAlign.left,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  );
}

///Navigate Push
goto(BuildContext context, Widget nextScreen) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///Navigate Without Back
gotoWithoutBack(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///Navigate Untill Remove
gotoUtillBack(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => nextScreen,
      ),
      (route) => false);
}

///Pop Navigate
goBack(BuildContext context) {
  Navigator.of(context).pop();
}

///SnackBar
showSnackbar(
  BuildContext context,
  String content,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: appColor,
      content: textBold(
        text: content,
        size: 16,
        color: white,
      ),
    ),
  );
}

///Vertical Space
Widget vSpace(
  double h,
) {
  return SizedBox(
    height: h,
  );
}

///Horizontal Space
Widget hSpace(
  double w,
) {
  return SizedBox(
    width: w,
  );
}

///Custom Indicator
Widget progressIndicator(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        backgroundColor: white,
        color: appColor,
      ),
    ),
  );
}

///Custom Indicator
Widget progressIndicatorforCheck(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        backgroundColor: white,
        color: red,
      ),
    ),
  );
}

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget batchFor({
  String text = "",
  double texSize = 10,
  Color? batchColor,
  Color? textColor,
  int? maxLine,
  double? heightData,
  double? widthData,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: batchColor,
    ),
    height: heightData,
    width: widthData,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(6),
        color: white,
        child: Center(
          child: textRegular(
            color: textColor,
            maxLine: maxLine,
            size: texSize,
            text: text,
          ),
        ),
      ),
    ),
  );
}

showAlertDialogFromUtil(
    BuildContext context, String message, String alertTitle) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      alertTitle,
      style: const TextStyle(color: Colors.red),
    ),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Color getRandomColor() {
  Random random = Random();
  int red =
      random.nextInt(256); // Generates a random value between 0 and 255 for red
  int green = random
      .nextInt(256); // Generates a random value between 0 and 255 for green
  int blue = random
      .nextInt(256); // Generates a random value between 0 and 255 for blue

  return Color.fromARGB(
      255, red, green, blue); // 255 is the alpha value (fully opaque)
}
