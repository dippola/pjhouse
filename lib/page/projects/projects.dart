import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../bottonbar.dart';
import '../../navItem.dart';
import '../../style.dart';
import '../../strings.dart';
import '../../topbar.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 150, maxWidth: 160),
        child: NavItem(),
      ),
      drawerEnableOpenDragGesture: false,
      body: Container(
        color: logoBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopBar(),
              ProjectsPageBody(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectsPageBody extends StatelessWidget {
  const ProjectsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/no2/no2_top_img.jpg',
                width: DeviceSize.getWidth(context),
                height: isMobile(context) ? DeviceSize.getWidth(context) : DeviceSize.getWidth(context) * 9 / 23,
                fit: BoxFit.cover,
              ),
              Container(
                width: DeviceSize.getWidth(context),
                height: isMobile(context) ? DeviceSize.getWidth(context) : DeviceSize.getWidth(context) * 9 / 23,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isMobile(context) ? 10.0 : 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ที่นี่มีบ้านที่อบอุ่นรอคุณอยู่',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            fontSize: isDesktop(context)
                                ? 25.0
                                : isTab(context)
                                    ? 23.0
                                    : 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: isDesktop(context) ? 18.0 : isTab(context) ? 14.0 : 12.0,
                        ),
                        Text(
                          'บ้านไม่ใช่เพียงแค่สถานที่สำหรับพักอาศัย แต่เป็นที่ที่เต็มไปด้วยเรื่องราวและความทรงจำของชีวิต',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            fontSize: isDesktop(context)
                                ? 20.0
                                : isTab(context)
                                    ? 20.0
                                    : 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: isDesktop(context) ? 18.0 : isTab(context) ? 14.0 : 12.0,
                        ),
                        Text(
                          'ขอให้บ้านหลังนี้เป็นมากกว่าตัวอาคาร แต่เป็นสถานที่ที่อบอวลไปด้วยความรักและความสุขสำหรับคุณ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            fontSize: isDesktop(context)
                                ? 17.0
                                : isTab(context)
                                    ? 17.0
                                    : 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 50.0),
          !isMobile(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: inBoxItemList(context),
                )
              : Column(
                  children: inBoxItemList(context),
                )
        ],
      ),
    );
  }

  Widget projectBoxItem(BuildContext context, double width, String imgPath, String text1, String text2, String text3, bool isSold, String url) {
    return Container(
      width: DeviceSize.getWidth(context) * width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 1, offset: Offset(1, 1), color: Colors.grey)]),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (url != 'preparing') {
                Navigator.pushNamed(context, url);
              } else {
                showToastWidget(
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      "ข้อมูลเพิ่มเติมอยู่ระหว่างการดำเนินการ",
                      style: GoogleFonts.kanit(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  duration: Duration(milliseconds: 1500),
                  context: context,
                  position: StyledToastPosition.center,
                );
              }
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15.0),
                  ),
                  child: Image.asset(
                    imgPath,
                    height: DeviceSize.getWidth(context) * width * (9 / 16),
                  ),
                ),
                isSold
                    ? Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: Image.asset(
                          'assets/images/sold_out.png',
                          width: 80.0,
                          height: 40.0,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            width: DeviceSize.getWidth(context) * width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 15.0),
                Text(
                  text1,
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  text2,
                  style: GoogleFonts.kanit(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16.0),
                ),
                SizedBox(height: 15.0),
                Text(
                  text3,
                  style: GoogleFonts.kanit(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.0),
                ElevatedButton.icon(
                  onPressed: () {
                    if (url != 'preparing') {
                      Navigator.pushNamed(context, url);
                    } else {
                      showToastWidget(
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black.withOpacity(0.7),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            "ข้อมูลเพิ่มเติมอยู่ระหว่างการดำเนินการ",
                            style: GoogleFonts.kanit(
                              fontSize: 17.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        duration: Duration(milliseconds: 1500),
                        context: context,
                        position: StyledToastPosition.center,
                      );
                    }
                  },
                  label: Text(
                    view_more,
                    style: GoogleFonts.kanit(color: topBarTextColor),
                  ),
                  icon: Icon(
                    Icons.arrow_right_alt_rounded,
                    color: topBarTextColor,
                  ),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    backgroundColor: whiteColor,
                    side: BorderSide(width: 2.0, color: topBarTextColor),
                    padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> inBoxItemList(BuildContext context) {
    return [
      projectBoxItem(
          context,
          isDesktop(context)
              ? 0.25
              : isTab(context)
                  ? 0.35
                  : 0.8,
          'assets/images/no2/no2main.jpg',
          pj2_saraburi_project,
          "หนองจักร อำเภอเมืองสระบุรี",
          pj2_livingroom + " | " + pj2_kitchen + " | " + pj2_bedroom + "\n" + pj2_toilet + " | " + pj2_parkcar + " | " + pj2_yard,
          false,
          // 'preparing'),
          '/project/no2'),
      isDesktop(context)
          ? SizedBox(width: 30.0)
          : isTab(context)
              ? SizedBox(width: 30.0)
              : SizedBox(height: 20.0),
      projectBoxItem(
          context,
          isDesktop(context)
              ? 0.25
              : isTab(context)
                  ? 0.35
                  : 0.8,
          'assets/images/no1/no1main.jpg',
          pj1_saraburi_project,
          "หนองจักร อำเภอเมืองสระบุรี",
          pj1_livingroom + " | " + pj1_kitchen + " | " + pj1_bedroom + "\n" + pj1_toilet + " | " + pj1_parkcar + " | " + pj1_yard,
          true,
          '/project/no1'),
    ];
  }
}
