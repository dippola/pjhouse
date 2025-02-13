import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1200 &&
    MediaQuery.of(context).size.width >= 650;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1200;

class DeviceSize {
  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

class DeviceOrientation {
  static getDeviceOrientation(BuildContext context) {
    // return MediaQuery.orientationOf(context);
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation;
  }
}

//desktop
// desktopTopBarTitleTextStyle(BuildContext context, bool isSelected) {
//   if (MediaQuery.of(context).size.width < 705) {
//     return const TextStyle(
//         fontWeight: FontWeight.bold, fontSize: 30.0, color: Color(0xff428b69));
//   } else {
//     return const TextStyle(
//         fontWeight: FontWeight.bold, fontSize: 30.0, color: Color(0xff428b69));
//   }
// }
desktopTopBarTitleTextStyle(BuildContext context) {
  if (MediaQuery.of(context).size.width < 740) {
    return Text('PJ House', style: GoogleFonts.kanit(fontSize: 20.0, color: Color(0xff428b69), fontWeight: FontWeight.bold,),);
  } else {
    return Text('PJ House', style: GoogleFonts.kanit(fontSize: 30.0, color: Color(0xff428b69), fontWeight: FontWeight.bold,),);
  }
}
desktopTopBarButtonTextStyle(bool isSelected){
  if (isSelected) {
    return GoogleFonts.kanit(color: Color(0xff428b69), fontWeight: FontWeight.bold, fontSize: 16.0, decoration: TextDecoration.underline, decorationThickness: 4.0);
  } else {
    return GoogleFonts.kanit(color: Color(0xff428b69), fontWeight: FontWeight.bold, fontSize: 16.0);
  }
}

bottomAboutTextColor1() {
  // return const TextStyle(
  //   color: Color(0xff428b69), fontWeight: FontWeight.bold, fontSize: 16.5
  // );
  return GoogleFonts.kanit(fontWeight: FontWeight.bold, color: Color(0xff428b69), fontSize: 16.5);
}

bottomAboutTextColor2() {
  // return const TextStyle(
  //     fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16.5,
  // );
  return GoogleFonts.kanit(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16.5);
}



var topBarTextColor = Color(0xff428b69);
var logoBackgroundColor = Color(0xffeef6ec);
var whiteColor = Colors.white;
var home2Color = Color(0xffd9e9d5);
var home2IconColor = Color(0xff428b6a);
var home2ColorLine = Color(0xffa2d096);

//home = หน้าแรก
//about us = เกี่ยวกับเรา
//project = โครงการ
//message = ข่าวสาร
