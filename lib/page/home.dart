import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pjhouse/bottonbar.dart';
import 'package:pjhouse/topbar.dart';
import '../navItem.dart';
import '../style.dart';

import 'package:google_fonts/google_fonts.dart';

import '../strings.dart';

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
            children: [TopBar(), Home1(), Home2(), Home3(), Home4(), BottomBar()],
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
                  style: GoogleFonts.kanit(
                      fontSize: w > 540
                          ? 25.0
                          : w <= 540 && w > 434
                              ? 16.0
                              : 13.0,
                      fontWeight: FontWeight.w300,
                      color: whiteColor),
                  textAlign: TextAlign.center),
              SizedBox(height: sizedBoxHeight(context)),
              Text(home1_2,
                  style: GoogleFonts.kanit(
                      fontSize: w > 540
                          ? 30.0
                          : w <= 540 && w > 434
                              ? 20.0
                              : 16.0,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                  textAlign: TextAlign.center),
              SizedBox(height: sizedBoxHeight(context)),
              Text(home1_3,
                  style: GoogleFonts.kanit(
                      fontSize: w > 450
                          ? 17.0
                          : w <= 540 && w > 434
                              ? 14.0
                              : 14.0,
                      fontWeight: FontWeight.w300,
                      color: whiteColor),
                  textAlign: TextAlign.center),
              SizedBox(height: sizedBoxHeight(context)),
              ElevatedButton(
                onPressed: () {
                  if (ModalRoute.of(context)!.settings.name != '/projects') {
                    Navigator.pushNamed(context, '/projects');
                  }
                },
                child: Text(
                  view_more,
                  style: GoogleFonts.kanit(
                    color: whiteColor,
                    fontSize: isDesktop(context)
                        ? 18.0
                        : isTab(context)
                            ? 16.0
                            : 13.0,
                  ),
                ),
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

  double sizedBoxHeight(BuildContext context) {
    double result;
    isDesktop(context)
        ? result = 18.0
        : isTab(context)
            ? result = 16.0
            : result = 8.0;
    return result;
  }
}

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

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
                style: GoogleFonts.kanit(
                  color: home2IconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile(context) && DeviceSize.getWidth(context) < 440
                      ? 10.0
                      : isMobile(context)
                          ? 13.0
                          : 16.0,
                ),
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
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20.0),
        Text(
          home3_2,
          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 23.0),
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
            style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 17.0),
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
    double getFontSize(BuildContext context) {
      double result;
      if (DeviceSize.getWidth(context) < 834 && DeviceSize.getWidth(context) >= 700) {
        result = 18.0;
      } else if (DeviceSize.getWidth(context) < 700) {
        result = 15.0;
      } else {
        result = 25.0;
      }
      return result;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          home3_1_m_t,
          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: getFontSize(context), fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20.0),
        Text(
          home3_2,
          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: DeviceSize.getWidth(context) < 660 ? 16.0 : 19.0),
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
            style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 17.0),
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
          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 7.0),
        Text(
          home3_2,
          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 16.0),
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
            style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 17.0),
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
                  Text(pj1_saraburi_project, style: GoogleFonts.kanit(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  Text(pj1_livingroom + " | " + pj1_kitchen + " | " + pj1_bedroom, style: GoogleFonts.kanit()),
                  Text(pj1_toilet + " | " + pj1_parkcar + " | " + pj1_yard, style: GoogleFonts.kanit()),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/projects') {
                        Navigator.pushNamed(context, '/projects');
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
                  Text(pj1_saraburi_project, style: GoogleFonts.kanit(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  Text(pj1_livingroom + " | " + pj1_kitchen + " | " + pj1_bedroom, style: GoogleFonts.kanit()),
                  Text(pj1_toilet + " | " + pj1_parkcar + " | " + pj1_yard, style: GoogleFonts.kanit()),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/projects') {
                        Navigator.pushNamed(context, '/projects');
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
                  Text(pj1_saraburi_project, style: GoogleFonts.kanit(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor)),
                  Text(pj1_livingroom + " | " + pj1_kitchen + " | " + pj1_bedroom, style: GoogleFonts.kanit()),
                  Text(pj1_toilet + " | " + pj1_parkcar + " | " + pj1_yard, style: GoogleFonts.kanit()),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/projects') {
                        Navigator.pushNamed(context, '/projec/no1ts');
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

class Home4 extends StatelessWidget {
  const Home4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: isDesktop(context)
            ? DeviceSize.getWidth(context) * 0.7
            : isTab(context)
                ? DeviceSize.getWidth(context) * 0.8
                : DeviceSize.getWidth(context) * 0.9,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: home2Color, width: 1.0)),
        margin: EdgeInsets.symmetric(vertical: isDesktop(context) ? 20.0 : 10.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: !isMobile(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/titleicon1.png",
                              height: 50.0,
                              width: 50.0,
                            ),
                            Text(
                              "PJ House",
                              style: GoogleFonts.kanit(
                                fontSize: 20.0,
                                color: Color(0xff428b69),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            home_about,
                            style: GoogleFonts.kanit(fontSize: 17.0),
                          ),
                        ),
                        Text(
                          '- PJ House -',
                          style: GoogleFonts.kanit(fontSize: 17.0),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/images/home4img.jpg'),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/titleicon1.png",
                            height: 50.0,
                            width: 50.0,
                          ),
                          Text(
                            "PJ House",
                            style: GoogleFonts.kanit(
                              fontSize: 20.0,
                              color: Color(0xff428b69),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          home_about,
                          style: GoogleFonts.kanit(fontSize: isMobile(context) ? 14.0 : 17.0),
                        ),
                      ),
                      Text(
                        '- PJ House -',
                        style: GoogleFonts.kanit(fontSize: isMobile(context) ? 14.0 : 17.0),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/images/home4img.jpg'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class HomeAbout extends StatelessWidget {
  const HomeAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
