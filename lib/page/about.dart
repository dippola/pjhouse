import 'package:flutter/material.dart';
import 'package:pjhouse/bottonbar.dart';
import 'package:pjhouse/navItem.dart';
import 'package:pjhouse/style.dart';
import 'package:pjhouse/topbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
              isDesktop(context)
                  ? AboutDesktop()
                  : isTab(context)
                      ? AboutDesktop()
                      : AboutMobile(),
              isDesktop(context)
                  ? AboutBottomDesktop()
                  : isTab(context)
                      ? AboutBottomDesktop()
                      : AboutBottomMobile(),
              BottomBar()
            ],
          ),
        ),
      ),
    );
  }
}

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(30.0),
        //   boxShadow: [
        //     BoxShadow(
        //         color: Colors.black.withOpacity(0.2), //그림자색
        //         spreadRadius: 5, //그림자 확장 정도
        //         blurRadius: 5, //그림자 흐림정도
        //         offset: Offset(3, 3) //그림자 위치
        //         )
        //   ],
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 1, offset: Offset(1, 1), color: Colors.grey)],
        ),
        width: DeviceSize.getWidth(context) * 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: DeviceSize.getWidth(context) * 0.2),
                        child: Image.asset('assets/images/circleicon.png'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SelectableText('PJ House', style: GoogleFonts.prompt(fontSize: 25.0, color: topBarTextColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Divider(height: 50, thickness: 0.5),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         (
                      //             'https://github.com/develiny/develiny_web');
                      //       },
                      //       child: Image.asset('images/githubicon.png',
                      //           width: 30, height: 30),
                      //     ),
                      //     SizedBox(width: 15),
                      //     InkWell(
                      //       onTap: () {
                      //         _launchURL(
                      //             'https://play.google.com/store/apps/dev?id=6375872941885163514');
                      //       },
                      //       child: Image.asset('images/playstoreicon.png',
                      //           width: 30, height: 30),
                      //     ),
                      //     SizedBox(width: 15),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Image.asset('images/appstoreicon.png',
                      //           width: 30, height: 30),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          "พีเจ เฮ้าส์ เป็นบริษัทโครงการบ้านจัดสรรในประเทศไทย",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.prompt(fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        SelectableText(
                          "เราให้บริการลูกค้าด้วยบ้านที่ปลอดภัย สวยงาม และเป็นครอบครัวที่กลมเกลียวกัน\nเราจะแนะนำโครงการที่ซื่อสัตย์บนพื้นฐานของความไว้วางใจ",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.prompt(fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        SelectableText(
                          "สร้างอนาคตกับ พีเจ เฮ้าส์",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.prompt(fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "- PJ House -",
                              style: GoogleFonts.prompt(),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 1, offset: Offset(1, 1), color: Colors.grey)],
        ),
        width: DeviceSize.getWidth(context) * 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/circleicon.png',
                  width: DeviceSize.getWidth(context) * 0.5,
                ),
                Text('PJ House', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, color: topBarTextColor, fontSize: 24.0)),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    color: home2Color,
                    height: 1.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        "พีเจ เฮ้าส์ เป็นบริษัทโครงการบ้านจัดสรรในประเทศไทย",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.prompt(),
                      ),
                      SizedBox(height: 10),
                      SelectableText(
                        "เราให้บริการลูกค้าด้วยบ้านที่ปลอดภัย สวยงาม และเป็นครอบครัวที่กลมเกลียวกัน\nเราจะแนะนำโครงการที่ซื่อสัตย์บนพื้นฐานของความไว้วางใจ",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.prompt(),
                      ),
                      SizedBox(height: 10),
                      SelectableText(
                        "สร้างอนาคตกับ พีเจ เฮ้าส์",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.prompt(),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                Text(
                  "- PJ House -",
                  style: GoogleFonts.prompt(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutBottomDesktop extends StatelessWidget {
  const AboutBottomDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            // Container(
            //   width: DeviceSize.getWidth(context)*0.8,
            //   height: 1.0,
            //   color: home2Color,
            // ),
            isDesktop(context) ? AboutBottomProjectDesktop() : AboutBottomProjectTab(),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

class AboutBottomMobile extends StatelessWidget {
  const AboutBottomMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              width: DeviceSize.getWidth(context) * 0.8,
              height: 1.0,
              color: home2Color,
            ),
            AboutBottomProjectMobile(),
            SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }
}

class AboutBottomProjectDesktop extends StatelessWidget {
  const AboutBottomProjectDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(color: home2ColorLine, width: 1.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name != '/project') {
                        Navigator.pushNamed(context, '/project');
                      }
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(30.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 3, offset: Offset(2, 2))]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/images/project1main.jpg',
                          width: 400.0,
                          // height: (p1.maxWidth * 0.85) * (10 / 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(width: 350.0, height: 1.0, color: home2Color),
                  SizedBox(height: 20.0),
                  Text('โครงการสระบุรี', style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  SizedBox(height: 20.0),
                  Text('ห้องนั่งเล่น1 | ครัว1 | ห้อง2', style: GoogleFonts.prompt()),
                  SizedBox(height: 20.0),
                  Text('ห้องน้ำ2 | ที่จอดรถ1 | ลาน', style: GoogleFonts.prompt()),
                ],
              ),
              SizedBox(width: 100.0),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("5 นาทีถึงร้านสะดวกซื้อ", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 7.0),
                    Text("5 นาทีถึงถนนใหญ่", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 7.0),
                    Text("ใกล้บริษัทนม", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 7.0),
                    Text("8 กม. ถึงตัวเมืองสระบุรี", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 40.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (ModalRoute.of(context)!.settings.name != '/project') {
                          Navigator.pushNamed(context, '/project');
                        }
                      },
                      label: Text(
                        'ดูเพิ่มเติม',
                        style: GoogleFonts.prompt(color: topBarTextColor),
                      ),
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: topBarTextColor,
                      ),
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        primary: whiteColor,
                        side: BorderSide(width: 2.0, color: topBarTextColor),
                        padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutBottomProjectTab extends StatelessWidget {
  const AboutBottomProjectTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        width: DeviceSize.getWidth(context) * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(color: home2ColorLine, width: 1.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name != '/project') {
                        Navigator.pushNamed(context, '/project');
                      }
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(30.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 3, offset: Offset(2, 2))]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/images/project1main.jpg',
                          width: (DeviceSize.getWidth(context) * 0.8) * 0.4,
                          // height: (p1.maxWidth * 0.85) * (10 / 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(width: (DeviceSize.getWidth(context) * 0.8) * 0.38, height: 1.0, color: home2Color),
                  SizedBox(height: 20.0),
                  Text('โครงการสระบุรี', style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  SizedBox(height: 20.0),
                  Text('ห้องนั่งเล่น1 | ครัว1 | ห้อง2', style: GoogleFonts.prompt()),
                  SizedBox(height: 20.0),
                  Text('ห้องน้ำ2 | ที่จอดรถ1 | ลาน', style: GoogleFonts.prompt()),
                ],
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("5 นาทีถึงร้านสะดวกซื้อ", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 7.0),
                    Text("5 นาทีถึงถนนใหญ่", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 7.0),
                    Text("ใกล้บริษัทนม", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 7.0),
                    Text("8 กม. ถึงตัวเมืองสระบุรี", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                    SizedBox(height: 40.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (ModalRoute.of(context)!.settings.name != '/project') {
                          Navigator.pushNamed(context, '/project');
                        }
                      },
                      label: Text(
                        'ดูเพิ่มเติม',
                        style: GoogleFonts.prompt(color: topBarTextColor),
                      ),
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: topBarTextColor,
                      ),
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        primary: whiteColor,
                        side: BorderSide(width: 2.0, color: topBarTextColor),
                        padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutBottomProjectMobile extends StatelessWidget {
  const AboutBottomProjectMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        width: DeviceSize.getWidth(context) * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(color: home2ColorLine, width: 1.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name != '/project') {
                        Navigator.pushNamed(context, '/project');
                      }
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(30.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 3, offset: Offset(2, 2))]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/images/project1main.jpg',
                          width: (DeviceSize.getWidth(context) * 0.8) * 0.75,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(width: (DeviceSize.getWidth(context) * 0.8) * 0.38, height: 1.0, color: home2Color),
                  SizedBox(height: 20.0),
                  Text('โครงการสระบุรี', style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  SizedBox(height: 20.0),
                  Text('ห้องนั่งเล่น1 | ครัว1 | ห้อง2', style: GoogleFonts.prompt()),
                  SizedBox(height: 20.0),
                  Text('ห้องน้ำ2 | ที่จอดรถ1 | ลาน', style: GoogleFonts.prompt()),
                  SizedBox(height: 20.0),
                  Container(width: (DeviceSize.getWidth(context) * 0.8) * 0.38, height: 1.0, color: home2Color),
                  SizedBox(height: 20.0),
                  Text("5 นาทีถึงร้านสะดวกซื้อ", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  SizedBox(height: 7.0),
                  Text("5 นาทีถึงถนนใหญ่", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  SizedBox(height: 7.0),
                  Text("ใกล้บริษัทนม", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  SizedBox(height: 7.0),
                  Text("8 กม. ถึงตัวเมืองสระบุรี", style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  SizedBox(height: 40.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/project') {
                        Navigator.pushNamed(context, '/project');
                      }
                    },
                    label: Text(
                      'ดูเพิ่มเติม',
                      style: GoogleFonts.prompt(color: topBarTextColor),
                    ),
                    icon: Icon(
                      Icons.arrow_right_alt_rounded,
                      color: topBarTextColor,
                    ),
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      primary: whiteColor,
                      side: BorderSide(width: 2.0, color: topBarTextColor),
                      padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL(String _url) async {
  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
