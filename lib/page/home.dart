import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pjhouse/bottonbar.dart';
import 'package:pjhouse/topbar.dart';
import '../navItem.dart';
import '../style.dart';

import 'package:google_fonts/google_fonts.dart';

import '../text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 180, maxWidth: 190),
        child: NavItem(),
      ),
      drawerEnableOpenDragGesture: false,
      body: Container(
        color: logoBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [TopBar(), Home1(), Home2(), Home3(), BottomBar()],
          ),
        ),
      ),
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = DeviceSize.getWidth(context);
    return Stack(
      children: [
        Image.asset(
          'assets/images/main1.jpg',
          width: w,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(home1_1,
                  style: GoogleFonts.prompt(
                      fontSize: w > 540
                          ? 25.0
                          : w <= 540 && w > 434
                              ? 16.0
                              : 13.0,
                      fontWeight: FontWeight.w300,
                      color: whiteColor),
                  textAlign: TextAlign.center),
              SizedBox(height: w > 434 ? 10.0 : 5.0),
              Text(home1_2,
                  style: GoogleFonts.prompt(
                      fontSize: w > 540
                          ? 30.0
                          : w <= 540 && w > 434
                              ? 20.0
                              : 16.0,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                  textAlign: TextAlign.center),
              SizedBox(
                  height: w > 434
                      ? 10.0
                      : w <= 434 && w > 350
                          ? 5.0
                          : 1.0),
              Text(home1_3,
                  style: GoogleFonts.prompt(
                      fontSize: w > 450
                          ? 17.0
                          : w <= 540 && w > 434
                              ? 14.0
                              : 14.0,
                      fontWeight: FontWeight.w300,
                      color: whiteColor),
                  textAlign: TextAlign.center),
              SizedBox(
                  height: w > 434
                      ? 20.0
                      : w <= 434 && w > 350
                          ? 8.0
                          : 2.0),
              ElevatedButton(
                onPressed: () {
                  if (ModalRoute.of(context)!.settings.name != '/projects') {
                    Navigator.pushNamed(context, '/projects');
                  }
                },
                child: Text(view_more,
                    style: GoogleFonts.prompt(
                        color: whiteColor,
                        fontSize: w > 540
                            ? 18.0
                            : w <= 540 && w > 350
                                ? 16.0
                                : 13.0)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(width: 2.0, color: whiteColor),
                  padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
                ),
              )
            ],
          ),
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
                text: home2_1,
                path: 'assets/images/main1box1.png',
              ),
              Container(
                width: 1.0,
                height: (DeviceSize.getWidth(context) * 0.65) * 0.3,
                color: home2ColorLine,
                constraints: BoxConstraints(maxHeight: 170.0),
              ),
              Home2Box(
                text: home2_2,
                path: 'assets/images/main1box2.png',
              ),
              Container(
                width: 1.0,
                height: (DeviceSize.getWidth(context) * 0.65) * 0.3,
                color: home2ColorLine,
                constraints: BoxConstraints(maxHeight: 170.0),
              ),
              Home2Box(text: home2_3, path: 'assets/images/main1box3.png'),
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
                style: GoogleFonts.prompt(color: home2IconColor, fontWeight: FontWeight.bold, fontSize: DeviceSize.getWidth(context) <= 434 ? 12.0 : 16.0),
                textAlign: TextAlign.center,
              )
            ],
          );
        },
      ),
    );
  }
}

class Home3 extends StatelessWidget {
  const Home3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isDesktop(context)
            ? Home3Desktop(context)
            : isTab(context)
                ? Home3Tab(context)
                : Home3Mobile(context));
  }

  Widget Home3Desktop(BuildContext context) {
    return Container(
      height: 500.0,
      constraints: BoxConstraints(minHeight: 500.0),
      width: DeviceSize.getWidth(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Home3TextDesktop(context),
            Home3ProjectDesktop(context),
          ],
        ),
      ),
    );
  }

  Widget Home3Tab(BuildContext context) {
    return Container(
      height: 400.0,
      width: DeviceSize.getWidth(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Home3TextTab(context),
            Home3ProjectTab(context),
          ],
        ),
      ),
    );
  }

  Widget Home3Mobile(BuildContext context) {
    return Container(
      height: null,
      width: DeviceSize.getWidth(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Home3TextMobile(context),
            Home3ProjectMobile(context),
          ],
        ),
      ),
    );
  }

  Widget Home3TextDesktop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          home3_1_d,
          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20.0),
        Text(
          home3_2,
          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 23.0),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            if (ModalRoute.of(context)!.settings.name != '/projects') {
              Navigator.pushNamed(context, '/projects');
            }
          },
          child: Text(
            view_project,
            style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 17.0),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: logoBackgroundColor,
            side: BorderSide(width: 2.0, color: topBarTextColor),
            padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
          ),
        )
      ],
    );
  }

  Widget Home3TextTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          home3_1_m_t,
          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 25.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20.0),
        Text(
          home3_2,
          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 19.0),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            if (ModalRoute.of(context)!.settings.name != '/projects') {
              Navigator.pushNamed(context, '/projects');
            }
          },
          child: Text(
            view_project,
            style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 17.0),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: logoBackgroundColor,
            side: BorderSide(width: 2.0, color: topBarTextColor),
            padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
          ),
        )
      ],
    );
  }

  Widget Home3TextMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          home3_1_m_t,
          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 7.0),
        Text(
          home3_2,
          style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 14.0),
        ElevatedButton(
          onPressed: () {
            if (ModalRoute.of(context)!.settings.name != '/projects') {
              Navigator.pushNamed(context, '/projects');
            }
          },
          child: Text(
            view_project,
            style: GoogleFonts.prompt(color: topBarTextColor, fontSize: 17.0),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: logoBackgroundColor,
            side: BorderSide(width: 2.0, color: topBarTextColor),
            padding: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 12.0, horizontal: 15.0),
          ),
        ),
        SizedBox(height: 23.0),
      ],
    );
  }

  Widget Home3ProjectDesktop(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0), boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2), //그림자색
              spreadRadius: 5, //그림자 확장 정도
              blurRadius: 5, //그림자 흐림정도
              offset: Offset(3, 3) //그림자 위치
              )
        ]),
        constraints: BoxConstraints(maxWidth: 400.0),
        child: LayoutBuilder(
          builder: (p0, p1) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 3, offset: Offset(2, 2))]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        'assets/images/project1main.jpg',
                        width: p1.maxWidth * 0.85,
                        height: (p1.maxWidth * 0.85) * (10 / 16),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(color: topBarTextColor, height: 1.0),
                  ),
                  Text(pj1_saraburi_project, style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  Text(pj1_livingroom + " | " + pj1_kitchen + " | " + pj1_bedroom, style: GoogleFonts.prompt()),
                  Text(pj1_toilet + " | " + pj1_parkcar + " | " + pj1_yard, style: GoogleFonts.prompt()),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/projects') {
                        Navigator.pushNamed(context, '/projects');
                      }
                    },
                    label: Text(
                      view_more,
                      style: GoogleFonts.prompt(color: topBarTextColor),
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
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget Home3ProjectTab(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0), boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2), //그림자색
              spreadRadius: 5, //그림자 확장 정도
              blurRadius: 5, //그림자 흐림정도
              offset: Offset(3, 3) //그림자 위치
              )
        ]),
        constraints: BoxConstraints(maxWidth: 320.0, maxHeight: 400),
        child: LayoutBuilder(
          builder: (p0, p1) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 3, offset: Offset(2, 2))]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        'assets/images/project1main.jpg',
                        width: p1.maxWidth * 0.85,
                        height: (p1.maxWidth * 0.85) * (10 / 16),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(color: topBarTextColor, height: 1.0),
                  ),
                  Text(pj1_saraburi_project, style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  Text(pj1_livingroom + " | " + pj1_kitchen + " | " + pj1_bedroom, style: GoogleFonts.prompt()),
                  Text(pj1_toilet + " | " + pj1_parkcar + " | " + pj1_yard, style: GoogleFonts.prompt()),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/projects') {
                        Navigator.pushNamed(context, '/projects');
                      }
                    },
                    label: Text(
                      view_more,
                      style: GoogleFonts.prompt(color: topBarTextColor),
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
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget Home3ProjectMobile(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0), boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2), //그림자색
              spreadRadius: 5, //그림자 확장 정도
              blurRadius: 5, //그림자 흐림정도
              offset: Offset(3, 3) //그림자 위치
              )
        ]),
        constraints: BoxConstraints(maxWidth: 320.0, maxHeight: 400),
        child: LayoutBuilder(
          builder: (p0, p1) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 3, offset: Offset(2, 2))]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        'assets/images/project1main.jpg',
                        width: p1.maxWidth * 0.85,
                        height: (p1.maxWidth * 0.85) * (10 / 16),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(color: topBarTextColor, height: 1.0),
                  ),
                  Text(pj1_saraburi_project, style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  Text(pj1_livingroom + " | " + pj1_kitchen + " | " + pj1_bedroom, style: GoogleFonts.prompt()),
                  Text(pj1_toilet + " | " + pj1_parkcar + " | " + pj1_yard, style: GoogleFonts.prompt()),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/projects') {
                        Navigator.pushNamed(context, '/projects');
                      }
                    },
                    label: Text(
                      view_more,
                      style: GoogleFonts.prompt(color: topBarTextColor),
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
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
