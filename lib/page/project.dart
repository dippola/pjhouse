import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottonbar.dart';
import '../navItem.dart';
import '../style.dart';
import '../topbar.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

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
                  ? ProjectDetailDesktop()
                  : isTab(context)
                      ? ProjectDetailTab()
                      : ProjectDetailMobile(),
              BottomBar()
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectDetailDesktop extends StatelessWidget {
  const ProjectDetailDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceSize.getWidth(context),
          height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
          child: Stack(
            children: [
              Container(
                width: DeviceSize.getWidth(context),
                child: Image.asset(
                  'assets/images/project1/project_page1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Container(
                  width: DeviceSize.getWidth(context) * 0.6,
                  height: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: whiteColor.withOpacity(0.8)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'สระบุรี @ บ้านในชนบท',
                          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'หากคุณต้องการบ้านชนบทในเมืองที่มีวิวสวยในขณะที่อยู่ใกล้เมือง เข้าร่วม PJ House',
                          style: GoogleFonts.prompt(fontSize: 20.0),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 1.0,
                          width: DeviceSize.getWidth(context) * 0.4,
                          color: topBarTextColor,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'ง่ายต่อการเข้าถึงสิ่งอำนวยความสะดวกต่าง ๆ ร้านสะดวกซื้อ ตลาด และเมืองที่อยู่ไม่ไกล\nปลอดภัยด้วยการติดตั้งผนังทุกด้านเพื่อความเป็นส่วนตัว',
                          style: GoogleFonts.prompt(height: 2, fontSize: 17.0),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Home2(),
        Row(
          children: [
            Container(
              //나눔1오
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Stack(
                children: [
                  Image.asset('assets/images/project1/project_page1back.png', fit: BoxFit.fill),
                  Center(
                    child: Container(
                      width: (DeviceSize.getWidth(context) * 0.5) * 0.7,
                      height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'แนะนำโครงการ',
                              style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 23.0, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 1,
                              width: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                              color: home2ColorLine,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ที่อยู่: ',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'หนองยาว อ.เมืองสระบุรี จ.สระบุรี',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ขนาดที่ดิน: ',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '55 ตะรางวะ',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ประเภท: ',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'บ้านในชนบท',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'โครงการเริ่มโอน: ',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'มิถุนายน 2566',
                                  style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //나눔1왼
              color: Colors.blueGrey,
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Image.asset(
                'assets/images/project1/project_page2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              //나눔2오
              color: Colors.blueGrey,
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Image.asset(
                'assets/images/project1/project_page3.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              //나눔2왼
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Stack(
                children: [
                  Image.asset('assets/images/project1/project_page2back.png', fit: BoxFit.fill),
                  Center(
                    child: Container(
                      width: (DeviceSize.getWidth(context) * 0.5) * 0.7,
                      height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'โครงสร้างภายใน',
                              style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 23.0, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 1,
                              width: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                              color: home2ColorLine,
                            ),
                            Text(
                              'ห้องนั่งเล่น 1 | ห้อง 2',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'ห้องน้ำ 2 | ครัว 1',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'ลานขนาดใหญ่ | ที่จอดรถ',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'โครงสร้างที่ออกแบบและปรับให้เหมาะกับชีวิต',
                              style: GoogleFonts.prompt(fontSize: 18.0, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          //편의시설
          children: [
            SizedBox(height: 40.0),
            Text(
              "สิ่งอำนวยความสะดวก",
              style: GoogleFonts.prompt(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: topBarTextColor,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 1.0,
              width: DeviceSize.getWidth(context) * 0.6,
              color: home2ColorLine,
            ),
            SizedBox(height: 20.0),
            Container(
              width: DeviceSize.getWidth(context) * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/seven.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        '7/11 ร้านสะดวกซื้อ',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '5km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '5min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/market.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        'ตลาด',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '5km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '5min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/city.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        'ตลาด',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '8km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '10min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ProjectPageView()
          ],
        )
      ],
    );
  }
}

class ProjectDetailTab extends StatelessWidget {
  const ProjectDetailTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceSize.getWidth(context),
          height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
          child: Stack(
            children: [
              Container(
                width: DeviceSize.getWidth(context),
                child: Image.asset(
                  'assets/images/project1/project_page1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Container(
                  width: DeviceSize.getWidth(context) * 0.6,
                  height: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: whiteColor.withOpacity(0.8)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'สระบุรี @ บ้านในชนบท',
                          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'หากคุณต้องการบ้านชนบทในเมืองที่มีวิวสวยในขณะที่อยู่ใกล้เมือง เข้าร่วม PJ House',
                          style: GoogleFonts.prompt(fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 1.0,
                          width: DeviceSize.getWidth(context) * 0.4,
                          color: topBarTextColor,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'ง่ายต่อการเข้าถึงสิ่งอำนวยความสะดวกต่าง ๆ ร้านสะดวกซื้อ ตลาด และเมืองที่อยู่ไม่ไกล\nปลอดภัยด้วยการติดตั้งผนังทุกด้านเพื่อความเป็นส่วนตัว',
                          style: GoogleFonts.prompt(height: DeviceSize.getWidth(context) > 670 ? 2 : 1.5, fontSize: DeviceSize.getWidth(context) > 670 ? 17.0 : 16.0),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Home2(),
        Row(
          children: [
            Container(
              //나눔1오
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Stack(
                children: [
                  Image.asset('assets/images/project1/project_page1back.png', fit: BoxFit.fill),
                  Center(
                    child: Container(
                      width: (DeviceSize.getWidth(context) * 0.5) * 0.7,
                      height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'แนะนำโครงการ',
                              style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 23.0, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 1,
                              width: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                              color: home2ColorLine,
                            ),
                            DeviceSize.getWidth(context) > 758
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ที่อยู่: ',
                                        style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'หนองยาว อ.เมืองสระบุรี จ.สระบุรี',
                                        style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 945 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ที่อยู่: ',
                                        style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'หนองยาว อ.เมืองสระบุรี จ.สระบุรี',
                                        style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 945 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ขนาดที่ดิน: ',
                                  style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '55 ตะรางวะ',
                                  style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ประเภท: ',
                                  style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'บ้านในชนบท',
                                  style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'โครงการเริ่มโอน: ',
                                  style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'มิถุนายน 2566',
                                  style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 790 ? 20.0 : 16.0, fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //나눔1왼
              color: Colors.blueGrey,
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Image.asset(
                'assets/images/project1/project_page2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              //나눔2오
              color: Colors.blueGrey,
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Image.asset(
                'assets/images/project1/project_page3.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              //나눔2왼
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Stack(
                children: [
                  Image.asset('assets/images/project1/project_page2back.png', fit: BoxFit.fill),
                  Center(
                    child: Container(
                      width: DeviceSize.getWidth(context) > 710 ? (DeviceSize.getWidth(context) * 0.5) * 0.7 : (DeviceSize.getWidth(context) * 0.5) * 0.9,
                      height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'โครงสร้างภายใน',
                              style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 23.0, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 1,
                              width: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                              color: home2ColorLine,
                            ),
                            Text(
                              'ห้องนั่งเล่น 1 | ห้อง 2',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'ห้องน้ำ 2 | ครัว 1',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'ลานขนาดใหญ่ | ที่จอดรถ',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'โครงสร้างที่ออกแบบและปรับให้เหมาะกับชีวิต',
                              style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 710 ? 18.0 : 16.0, fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          //편의시설
          children: [
            SizedBox(height: 40.0),
            Text(
              "สิ่งอำนวยความสะดวก",
              style: GoogleFonts.prompt(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: topBarTextColor,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 1.0,
              width: DeviceSize.getWidth(context) * 0.6,
              color: home2ColorLine,
            ),
            SizedBox(height: 20.0),
            Container(
              width: DeviceSize.getWidth(context) * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/seven.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        '7/11 ร้านสะดวกซื้อ',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '5km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '5min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/market.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        'ตลาด',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '5km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '5min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/city.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        'ตลาด',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '8km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '10min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ProjectPageView()
          ],
        )
      ],
    );
  }
}

class ProjectDetailMobile extends StatelessWidget {
  const ProjectDetailMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceSize.getWidth(context),
          height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
          child: Stack(
            children: [
              Container(
                width: DeviceSize.getWidth(context),
                child: Image.asset(
                  'assets/images/project1/project_page1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Container(
                  width: DeviceSize.getWidth(context) * 0.85,
                  height: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: whiteColor.withOpacity(0.8)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'สระบุรี @ บ้านในชนบท',
                          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          'หากคุณต้องการบ้านชนบทในเมืองที่มีวิวสวยในขณะที่อยู่ใกล้เมือง เข้าร่วม PJ House',
                          style: GoogleFonts.prompt(fontSize: 14.0, height: 1.1),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          height: 1.0,
                          width: DeviceSize.getWidth(context) * 0.6,
                          color: topBarTextColor,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'ง่ายต่อการเข้าถึงสิ่งอำนวยความสะดวกต่าง ๆ ร้านสะดวกซื้อ ตลาด และเมืองที่อยู่ไม่ไกล\nปลอดภัยด้วยการติดตั้งผนังทุกด้านเพื่อความเป็นส่วนตัว',
                          style: GoogleFonts.prompt(height: 1.1, fontSize: DeviceSize.getWidth(context) > 335 ? 13.0 : 11.0),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Home2(),
        Column(
          children: [
            Container(
              //나눔1
              color: Colors.blueGrey,
              width: DeviceSize.getWidth(context),
              height: DeviceSize.getWidth(context) * 0.8,
              child: Image.asset(
                'assets/images/project1/project_page2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Container(
          //나눔2
          width: DeviceSize.getWidth(context),
          height: DeviceSize.getWidth(context) * 0.7,
          child: Stack(
            children: [
              Image.asset('assets/images/project1/project_page1back.png', fit: BoxFit.fill),
              Center(
                child: Container(
                  width: DeviceSize.getWidth(context) * 0.7,
                  height: DeviceSize.getWidth(context) * 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'แนะนำโครงการ',
                          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 1,
                          width: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                          color: home2ColorLine,
                        ),
                        DeviceSize.getWidth(context) > 758
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ที่อยู่: ',
                                    style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'หนองยาว อ.เมืองสระบุรี จ.สระบุรี',
                                    style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ที่อยู่: ',
                                    style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'หนองยาว อ.เมืองสระบุรี จ.สระบุรี',
                                    style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ขนาดที่ดิน: ',
                              style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '55 ตะรางวะ',
                              style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ประเภท: ',
                              style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'บ้านในชนบท',
                              style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) >= 324 ? 16.0 : 15.0, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'โครงการเริ่มโอน: ',
                              style: GoogleFonts.prompt(
                                  fontSize: DeviceSize.getWidth(context) >= 324
                                      ? 16.0
                                      : DeviceSize.getWidth(context) < 324 && DeviceSize.getWidth(context) > 302
                                          ? 15.0
                                          : 13.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'มิถุนายน 2566',
                              style: GoogleFonts.prompt(
                                  fontSize: DeviceSize.getWidth(context) >= 324
                                      ? 16.0
                                      : DeviceSize.getWidth(context) < 324 && DeviceSize.getWidth(context) > 302
                                          ? 15.0
                                          : 13.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              //나눔3
              color: Colors.blueGrey,
              width: DeviceSize.getWidth(context),
              height: DeviceSize.getWidth(context) * 0.8,
              child: Image.asset(
                'assets/images/project1/project_page3.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              //나눔4
              width: DeviceSize.getWidth(context),
              height: DeviceSize.getWidth(context) * 0.8,
              child: Stack(
                children: [
                  Image.asset('assets/images/project1/project_page2back.png', fit: BoxFit.fill),
                  Center(
                    child: Container(
                      width: DeviceSize.getWidth(context) * 0.9,
                      height: DeviceSize.getWidth(context) * 0.9,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'โครงสร้างภายใน',
                              style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 23.0, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 1,
                              width: (DeviceSize.getWidth(context) * 0.5) * 0.8,
                              color: home2ColorLine,
                            ),
                            Text(
                              'ห้องนั่งเล่น 1 | ห้อง 2',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'ห้องน้ำ 2 | ครัว 1',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'ลานขนาดใหญ่ | ที่จอดรถ',
                              style: GoogleFonts.prompt(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'โครงสร้างที่ออกแบบและปรับให้เหมาะกับชีวิต',
                              style: GoogleFonts.prompt(fontSize: DeviceSize.getWidth(context) > 320 ? 16.0 : 15.0, fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          //편의시설
          children: [
            SizedBox(height: 40.0),
            Text(
              "สิ่งอำนวยความสะดวก",
              style: GoogleFonts.prompt(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: topBarTextColor,
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 1.0,
              width: DeviceSize.getWidth(context) * 0.6,
              color: home2ColorLine,
            ),
            SizedBox(height: 15.0),
            Container(
              width: DeviceSize.getWidth(context) * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/seven.png',
                        width: DeviceSize.getWidth(context) * 0.2,
                      ),
                      Text(
                        '7/11 ร้านสะดวกซื้อ',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '5km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '5min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(height: 1.0, width: DeviceSize.getWidth(context) * 0.5, color: home2Color),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/market.png',
                        width: DeviceSize.getWidth(context) * 0.2,
                      ),
                      Text(
                        'ตลาด',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '5km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '5min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(height: 1.0, width: DeviceSize.getWidth(context) * 0.5, color: home2Color),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/project1/city.png',
                        width: DeviceSize.getWidth(context) * 0.2,
                      ),
                      Text(
                        'ตลาด',
                        style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        '8km',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        '10min',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ProjectPageView()
          ],
        )
      ],
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  //흥미로운 위치 ทําเลน่าสนใจ
  //디자인 ออกแบบ
  //안전함 ปลอดภัย

  @override
  Widget build(BuildContext context) {
    double w = DeviceSize.getWidth(context) * 0.65;
    return Container(
      color: home2Color,
      width: DeviceSize.getWidth(context),
      height: null,
      child: Center(
        child: Container(
          width: w,
          constraints: BoxConstraints(maxHeight: 170.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 1.0,
                height: (DeviceSize.getWidth(context) * 0.65) * 0.3,
                color: home2ColorLine,
                constraints: BoxConstraints(maxHeight: 170.0),
              ),
              Home2Box(
                text: 'ทําเลน่าสนใจ',
                path: 'assets/images/main1box1.png',
              ),
              Container(
                width: 1.0,
                height: (DeviceSize.getWidth(context) * 0.65) * 0.3,
                color: home2ColorLine,
                constraints: BoxConstraints(maxHeight: 170.0),
              ),
              Home2Box(
                text: 'ออกแบบ',
                path: 'assets/images/main1box2.png',
              ),
              Container(
                width: 1.0,
                height: (DeviceSize.getWidth(context) * 0.65) * 0.3,
                color: home2ColorLine,
                constraints: BoxConstraints(maxHeight: 170.0),
              ),
              Home2Box(text: 'ปลอดภัย', path: 'assets/images/main1box3.png'),
              Container(
                width: 1.0,
                height: (DeviceSize.getWidth(context) * 0.65) * 0.3,
                color: home2ColorLine,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home2Box extends StatelessWidget {
  const Home2Box({Key? key, required this.text, required this.path}) : super(key: key);
  final String text;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (DeviceSize.getWidth(context) * 0.65) * 0.3,
      height: (DeviceSize.getWidth(context) * 0.65) * 0.3,
      constraints: BoxConstraints(maxWidth: 170.0, maxHeight: 170.0),
      child: LayoutBuilder(
        builder: (p0, p1) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                path,
                width: p1.maxWidth * 0.65,
                height: p1.maxWidth * 0.65,
              ),
              SizedBox(
                height: !isMobile(context) ? 8.0 : 0.0,
              ),
              Text(
                text,
                // style: GoogleFonts.prompt(color: home2IconColor, fontWeight: FontWeight.bold, fontSize: DeviceSize.getWidth(context) <= 434 ? 12.0 : 16.0),
                style: GoogleFonts.prompt(
                    color: home2IconColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.getWidth(context) > 434
                        ? 16.0
                        : DeviceSize.getWidth(context) <= 434 && DeviceSize.getWidth(context) >= 326
                            ? 12.0
                            : 9.0),
                textAlign: TextAlign.center,
              )
            ],
          );
        },
      ),
    );
  }
}

class ProjectPageView extends StatefulWidget {
  const ProjectPageView({Key? key}) : super(key: key);

  @override
  State<ProjectPageView> createState() => _ProjectPageViewState();
}

class _ProjectPageViewState extends State<ProjectPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String pages = '1/6';

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls;
    imageUrls = [
      'assets/images/project1/pageview/pageview1.jpg',
      'assets/images/project1/pageview/pageview2.jpg',
      'assets/images/project1/pageview/pageview3.jpg',
      'assets/images/project1/pageview/pageview4.jpg',
      'assets/images/project1/pageview/pageview5.jpg',
      'assets/images/project1/pageview/pageview6.jpg'
    ];
    return Column(
      children: [
        Container(height: 1.0, width: DeviceSize.getWidth(context) * 0.6, color: home2ColorLine),
        SizedBox(height: 20.0),
        Text(
          "คอลเลกชันภาพถ่าย",
          style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (_currentPage > 1) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    _currentPage--;
                    pages = '$_currentPage/6';
                  });
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: home2ColorLine,
              ),
            ),
            Stack(
              children: [
                Container(
                  width: isDesktop(context) ? DeviceSize.getWidth(context) * 0.6 : DeviceSize.getWidth(context) * 0.7,
                  height: isDesktop(context) ? (DeviceSize.getWidth(context) * 0.6) * 0.625 : (DeviceSize.getWidth(context) * 0.7) * 0.625,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            imageUrls[index],
                          ),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      _currentPage = index + 1;
                      setState(() {
                        pages = '$_currentPage/6';
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 5.0,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Colors.black.withOpacity(0.5)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                      child: Text(
                        pages,
                        style: GoogleFonts.prompt(color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                if (_currentPage < 6) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    _currentPage++;
                    pages = '$_currentPage/6';
                  });
                }
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: home2ColorLine,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
