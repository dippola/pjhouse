import 'dart:async';
import 'dart:js_interop';
import 'dart:ui_web';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjhouse/page/project_img_dialog.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../bottonbar.dart';
import '../../navItem.dart';
import '../../style.dart';
import '../../strings.dart';
import '../../topbar.dart';
import '../home.dart';

@JS('document')
external JSObject get doc;

extension DocumentExtension on JSObject {
  @JS('documentElement')
  external JSObject get documentElement;

  @JS('fullscreenElement')
  external JSObject? get fullscreenElement;

  @JS('exitFullscreen')
  external void exitFullscreen();
}

extension ElementExtension on JSObject {
  @JS('requestFullscreen')
  external void requestFullscreen();
}

bool back1 = false;
bool pic1 = false;
bool back2 = false;
bool pic2 = false;

class ProjectNo1Page extends StatelessWidget {
  const ProjectNo1Page({Key? key}) : super(key: key);

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
                  ? ProjectNo1DetailDesktop()
                  : isTab(context)
                      ? ProjectNo1DetailTab()
                      : ProjectNo1DetailMobile(),
              ProjectNo1Video(),
              BottomBar()
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectNo1DetailDesktop extends StatelessWidget {
  const ProjectNo1DetailDesktop({Key? key}) : super(key: key);

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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: project1_top1,
                  placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
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
                          project1_1_1,
                          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          project1_1_2,
                          style: GoogleFonts.kanit(fontSize: 20.0),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 1.0,
                          width: DeviceSize.getWidth(context) * 0.4,
                          color: topBarTextColor,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          project1_1_3,
                          style: GoogleFonts.kanit(height: 2, fontSize: 17.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          project1_1_4,
                          style: GoogleFonts.kanit(height: 2, fontSize: 17.0),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Home2(),
        Row(
          children: [
            Container(
              //나눔1왼
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_1pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
            Container(
              //나눔1왼
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_2pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              //나눔2오
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_3pic,
                placeholder: (context, url) => Shimmer.fromColors(baseColor: Colors.grey, highlightColor: Colors.white, child: Container(color: Colors.grey)),
              ),
            ),
            Container(
              //나눔2오
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_4pic,
                placeholder: (context, url) => Shimmer.fromColors(baseColor: Colors.grey, highlightColor: Colors.white, child: Container(color: Colors.grey)),
              ),
            ),
          ],
        ),
        ProjectNo1Map(),
        Column(
          //편의시설
          children: [
            SizedBox(height: 30.0),
            Text(
              project1_4_1,
              style: GoogleFonts.kanit(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: topBarTextColor,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              width: DeviceSize.getWidth(context) * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/seven.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        project1_4_2,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        project1_4_3,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_4,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/market.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        project1_4_5,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        project1_4_3,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_4,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/city.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        project1_4_5,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        proejct1_4_6,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_7,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ProjectNo1PageView()
          ],
        )
      ],
    );
  }
}

class ProjectNo1DetailTab extends StatelessWidget {
  const ProjectNo1DetailTab({Key? key}) : super(key: key);

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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: project1_top1,
                  placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
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
                          project1_1_1,
                          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          project1_1_2,
                          style: GoogleFonts.kanit(fontSize: 20.0),
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
                          project1_1_3,
                          style: GoogleFonts.kanit(height: DeviceSize.getWidth(context) > 670 ? 2 : 1.5, fontSize: DeviceSize.getWidth(context) > 670 ? 17.0 : 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          project1_1_4,
                          style: GoogleFonts.kanit(height: DeviceSize.getWidth(context) > 670 ? 2 : 1.5, fontSize: DeviceSize.getWidth(context) > 670 ? 17.0 : 16.0),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Home2(),
        Row(
          children: [
            Container(
              //나눔1왼
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_1pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
            Container(
              //나눔1왼
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_2pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              //나눔2오
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_3pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
            Container(
              //나눔2왼
              width: DeviceSize.getWidth(context) * 0.5,
              height: (DeviceSize.getWidth(context) * 0.5) * 0.8,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: project1_4pic,
                    placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        ProjectNo1Map(),
        Column(
          //편의시설
          children: [
            SizedBox(height: 30.0),
            Text(
              project1_4_1,
              style: GoogleFonts.kanit(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: topBarTextColor,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              width: DeviceSize.getWidth(context) * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/seven.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        project1_4_2,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        project1_4_3,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_4,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/market.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        project1_4_5,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        project1_4_3,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_4,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/city.png',
                        width: (DeviceSize.getWidth(context) * 0.3) * 0.2,
                      ),
                      Text(
                        project1_4_5,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        proejct1_4_6,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_7,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ProjectNo1PageView()
          ],
        )
      ],
    );
  }
}

class ProjectNo1DetailMobile extends StatelessWidget {
  const ProjectNo1DetailMobile({Key? key}) : super(key: key);

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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: project1_top1,
                  placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
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
                          project1_1_1,
                          style: GoogleFonts.kanit(color: topBarTextColor, fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          project1_1_2,
                          style: GoogleFonts.kanit(fontSize: 14.0, height: 1.1),
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
                          project1_1_3,
                          style: GoogleFonts.kanit(height: 1.1, fontSize: DeviceSize.getWidth(context) > 335 ? 13.0 : 11.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          project1_1_4,
                          style: GoogleFonts.kanit(height: 1.1, fontSize: DeviceSize.getWidth(context) > 335 ? 13.0 : 11.0),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Home2(),
        Column(
          children: [
            Container(
              //나눔1
              width: DeviceSize.getWidth(context),
              height: DeviceSize.getWidth(context) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_2pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              //나눔1
              width: DeviceSize.getWidth(context),
              height: DeviceSize.getWidth(context) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_1pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              //나눔1
              width: DeviceSize.getWidth(context),
              height: DeviceSize.getWidth(context) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_3pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              //나눔1
              width: DeviceSize.getWidth(context),
              height: DeviceSize.getWidth(context) * 0.8,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_4pic,
                placeholder: (context, url) => Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white),
              ),
            ),
          ],
        ),
        ProjectNo1Map(),
        Column(
          //편의시설
          children: [
            SizedBox(height: 30.0),
            Text(
              project1_4_1,
              style: GoogleFonts.kanit(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: topBarTextColor,
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: DeviceSize.getWidth(context) * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/seven.png',
                        width: DeviceSize.getWidth(context) * 0.2,
                      ),
                      Text(
                        project1_4_2,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        project1_4_3,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_4,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(height: 1.0, width: DeviceSize.getWidth(context) * 0.5, color: home2Color),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/market.png',
                        width: DeviceSize.getWidth(context) * 0.2,
                      ),
                      Text(
                        project1_4_5,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        project1_4_3,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_4,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(height: 1.0, width: DeviceSize.getWidth(context) * 0.5, color: home2Color),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/no1/city.png',
                        width: DeviceSize.getWidth(context) * 0.2,
                      ),
                      Text(
                        project1_4_5,
                        style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        proejct1_4_6,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Text(
                        project1_4_7,
                        style: GoogleFonts.kanit(fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ProjectNo1PageView()
          ],
        )
      ],
    );
  }
}

class ProjectNo1Map extends StatelessWidget {
  const ProjectNo1Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          project1_map_text,
          style: GoogleFonts.kanit(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: topBarTextColor,
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            showZoomOneDialog(context, project1_map);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 5, blurRadius: 5, offset: Offset(3, 3))]),
            height: isDesktop(context)
                ? DeviceSize.getWidth(context) * 0.4
                : isTab(context)
                    ? DeviceSize.getWidth(context) * 0.55
                    : DeviceSize.getWidth(context) * 0.75,
            width: isDesktop(context)
                ? DeviceSize.getWidth(context) * 0.4
                : isTab(context)
                    ? DeviceSize.getWidth(context) * 0.55
                    : DeviceSize.getWidth(context) * 0.75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              // child: Shimmer.fromColors(
              //   baseColor: Colors.red,
              //   highlightColor: Colors.yellow,
              //   child: Container(),
              // ),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: project1_map,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        Container(
          height: 1.0,
          width: DeviceSize.getWidth(context) * 0.6,
          color: home2ColorLine,
        ),
      ],
    );
  }
}

class ProjectNo1PageView extends StatefulWidget {
  const ProjectNo1PageView({Key? key}) : super(key: key);

  @override
  State<ProjectNo1PageView> createState() => _ProjectNo1PageViewState();
}

class _ProjectNo1PageViewState extends State<ProjectNo1PageView> {
  final PageController _pageController = PageController();
  int _currentPage = 1;
  String pages = '1/10';
  late int size;

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls;
    imageUrls = [
      project1_pageview1,
      project1_pageview2,
      project1_pageview3,
      project1_pageview4,
      project1_pageview5,
      project1_pageview6,
      project1_pageview7,
      project1_pageview8,
      project1_pageview9,
      project1_pageview10,
    ];
    size = imageUrls.length;
    return Column(
      children: [
        Container(height: 1.0, width: DeviceSize.getWidth(context) * 0.6, color: home2ColorLine),
        SizedBox(height: 20.0),
        Text(
          project1_pageview,
          style: GoogleFonts.kanit(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 18.0),
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
                    pages = '$_currentPage/$size';
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
                        child: InkWell(
                          onTap: () {
                            showZoomPageViewDialog(context, imageUrls, _currentPage);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            // child: Image.asset(
                            //   imageUrls[index],
                            // ),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: imageUrls[index],
                              placeholder: (context, url) {
                                return Shimmer.fromColors(child: Container(color: Colors.grey), baseColor: Colors.grey, highlightColor: Colors.white);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      _currentPage = index + 1;
                      setState(() {
                        pages = '$_currentPage/$size';
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
                        style: GoogleFonts.kanit(color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                if (_currentPage < imageUrls.length) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    _currentPage++;
                    pages = '$_currentPage/$size';
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

class ProjectNo1Video extends StatefulWidget {
  const ProjectNo1Video({super.key});

  @override
  State<ProjectNo1Video> createState() => _ProjectNo1VideoState();
}

class _ProjectNo1VideoState extends State<ProjectNo1Video> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  bool _isDragging = false; // ⭐ 식바 드래그 상태 확인용
  double _dragValue = 0.0; // ⭐ 드래그 중인 임시 값
  Timer? _hideTimer;
  bool isFullScreen = false;
  bool _isInitializedOnce = false;

  // ⭐ 전체화면 종료 후 영상 투명화 방지를 위한 키
  Key _videoPlayerKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(project1_video_url),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true), // 웹 브라우저 호환성 향상
    )..initialize().then((_) {
      if (mounted) {
        setState(() {
          _isInitializedOnce = true;
        });
      }
    });
    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    if (_isDragging || !mounted) return;

    final pos = _controller.value.position;
    final dur = _controller.value.duration;

    // 엔진이 아직 유효한 위치를 찾지 못했을 때(0초이면서 초기화 직후인 상황) 업데이트 차단
    if (pos == Duration.zero && !_controller.value.isPlaying) {
      return;
    }

    // 영상의 끝에 도달했을 때 0으로 튕기는 현상 방지
    if (pos >= dur && dur != Duration.zero) return;

    setState(() {});
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    if (!_controller.value.isPlaying) return;
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showControls = false);
    });
  }

  void _togglePlay() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
      _startHideTimer();
    });
  }

// ⭐ 최종 수정 1: 위치 저장 및 복구 로직 추가
  void _toggleFullScreen(double maxDuration, double currentPos) {
    // 1. 브라우저 전체화면 요청
    try {
      if (doc.fullscreenElement == null) {
        // ⭐ 수정된 부분: 브라우저 fullscreen만 사용
        doc.documentElement.requestFullscreen();
      } else {
        doc.exitFullscreen();
      }
    } catch (_) {}
    isFullScreen = true;
    // 2. 플러터 페이지 이동
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // child: VideoPlayer(_controller),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(
                          _controller,
                          key: _videoPlayerKey, // ⭐ 투명화 방지 키 적용
                        ),
                      ),
                    ),
                  ),

                  // 2. 터치 및 컨트롤 레이어
                  Positioned.fill(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => setState(() {
                        _showControls = !_showControls;
                        if (_showControls) _startHideTimer();
                      }),
                      child: AnimatedOpacity(
                        opacity: _showControls ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Stack(
                          children: [
                            Center(
                              child: IconButton(
                                icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 60, color: Colors.white),
                                onPressed: _togglePlay,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: _buildControlBar(currentPos, maxDuration),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
        .then(
      (_) async {
        // 3. 돌아왔을 때 처리
        try {
          if (doc.fullscreenElement != null) {
            doc.exitFullscreen();
          }
        } catch (_) {}

        // [중요] 현재 재생 상태와 위치를 미리 저장해둡니다.
        final wasPlaying = _controller.value.isPlaying;
        final savedPosition = _controller.value.position;

        // 브라우저 애니메이션 대기
        await Future.delayed(const Duration(milliseconds: 500));

        if (mounted) {
          setState(() {
            // 키 교체 (이때 비디오가 리셋됨)
            _videoPlayerKey = UniqueKey();
          });
        }

        // [중요] 키 교체 후 비디오가 다시 로드될 시간을 살짝 기다린 뒤 위치 복구
        await Future.delayed(const Duration(milliseconds: 100));

        await _controller.seekTo(savedPosition); // 저장된 위치로 이동
        if (wasPlaying) {
          await _controller.play(); // 재생 중이었다면 다시 재생
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. 컨트롤러가 초기화되지 않았을 때의 처리 (중요: size 값을 가져오기 위함)
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

// ⭐ 해결책 A: duration이 0으로 잡히는 초기 로딩 오류 방지
    final double durationInMs = _controller.value.duration.inMilliseconds.toDouble();
    final double maxDuration = durationInMs > 0 ? durationInMs : 1.0;

    // ⭐ 해결책 B: 드래그 중엔 임시값, 아닐 땐 실제 위치를 사용하되 전체 길이를 넘지 않게 고정
    double currentPos;
    if (_isDragging) {
      currentPos = _dragValue;
    } else {
      // 초기화 전이면 0, 초기화 후면 실제 위치 사용
      currentPos = _controller.value.isInitialized
          ? _controller.value.position.inMilliseconds.toDouble()
          : 0.0;
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          isDesktop(context)
              ? 50
              : isTab(context)
                  ? 40
                  : 30,
          0,
          0),
      child: Center(
        child: Container(
          // 컨테이너 장식
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(3, 3),
              )
            ],
          ),
          // 컨테이너 제약 조건 (4:5 비율 유지를 위한 설정)
          constraints: BoxConstraints(
            maxHeight: !isMobile(context) ? DeviceSize.getHeight(context) * 0.8 : (DeviceSize.getWidth(context) * 0.9) * 1.25,
            maxWidth: !isMobile(context) ? DeviceSize.getHeight(context) * 0.8 * 0.8 : DeviceSize.getWidth(context) * 0.9,
          ),
          child: VisibilityDetector(
            key: const Key('project-video-key'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction == 0) {
                _controller.pause();
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              // ⭐ 불필요한 CupertinoPageScaffold와 SafeArea를 제거했습니다.
              child: MouseRegion(
                onEnter: (_) => setState(() {
                  _showControls = true;
                  _startHideTimer();
                }),
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: Stack(
                    children: [
                      // 1. 배경 영상 레이어
                      Positioned.fill(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            width: _controller.value.size.width,
                            height: _controller.value.size.height,
                            child: VideoPlayer(
                              _controller,
                              key: _videoPlayerKey, // ⭐ 투명화 방지 키 적용
                            ),
                          ),
                        ),
                      ),

                      // 2. 터치 및 컨트롤 레이어
                      Positioned.fill(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => setState(() {
                            _showControls = !_showControls;
                            if (_showControls) _startHideTimer();
                          }),
                          child: AnimatedOpacity(
                            opacity: _showControls ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: Stack(
                              children: [
                                Center(
                                  child: IconButton(
                                    icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 60, color: Colors.white),
                                    onPressed: _togglePlay,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: _buildControlBar(currentPos, maxDuration),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControlBar(double currentPos, double maxDuration) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.black45,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              activeTrackColor: Colors.amber,
              inactiveTrackColor: Colors.white30,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
            ),
            child: Slider(
              key: ValueKey('slider_main_${_controller.hashCode}'),
              value: currentPos,
              min: 0.0,
              max: maxDuration,

              // ⭐ 최종 수정 2: 식바 0초 점프 문제 해결
              // 터치가 시작되는 순간, _dragValue를 0이 아닌 '현재 슬라이더 값'으로 초기화해야 합니다.
              onChangeStart: (value) {
                setState(() {
                  _isDragging = true;
                  _dragValue = value; // 0.0이 아니라 터치한 시점의 값으로 초기화
                });
              },

              onChanged: (value) {
                setState(() {
                  _dragValue = value; // 드래그 중 값 업데이트
                });
              },

              onChangeEnd: (value) async {
                setState(() { _isDragging = true; });

                try {
                  // 1. 웹 브라우저에게 "이 영상은 활성 상태다"라고 알리기 위해 재생 먼저 시도
                  if (!_controller.value.isPlaying) {
                    await _controller.play();
                  }

                  // 2. 이동
                  await _controller.seekTo(Duration(milliseconds: value.toInt()));

                  // 3. ⭐ 이동한 위치의 버퍼를 가져올 시간을 더 넉넉히 줌 (웹 사양에 따라 조절)
                  await Future.delayed(const Duration(milliseconds: 500));

                } finally {
                  // 만약 원래 정지 상태였다면 다시 멈춤 (원하는 동작에 따라 선택)
                  // await _controller.pause();

                  Future.delayed(const Duration(milliseconds: 300), () {
                    if (mounted) setState(() { _isDragging = false; });
                  });
                }
              },
            ),
          ),
          Row(
            children: [
              Text(
                "${_formatDuration(Duration(milliseconds: currentPos.toInt()))} / ${_formatDuration(Duration(milliseconds: maxDuration.toInt()))}",
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                  icon: const Icon(Icons.fullscreen, color: Colors.white),
                  onPressed: () {
                    if (!isFullScreen) {
                      _toggleFullScreen(maxDuration, currentPos);
                    } else {
                      isFullScreen = false;
                      Navigator.pop(context);
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }
}

// class ProjectNo1Video extends StatefulWidget {
//   const ProjectNo1Video({super.key});
//
//   @override
//   State<ProjectNo1Video> createState() => _ProjectNo1VideoState();
// }
//
// class _ProjectNo1VideoState extends State<ProjectNo1Video> {
//   late CustomVideoPlayerWebController _customVideoPlayerWebController;
//   final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings = CustomVideoPlayerWebSettings(src: project1_video_url);
//
//   @override
//   void initState() {
//     super.initState();
//
//     _customVideoPlayerWebController = CustomVideoPlayerWebController(webVideoPlayerSettings: _customVideoPlayerWebSettings);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(
//           0,
//           isDesktop(context)
//               ? 50
//               : isTab(context)
//               ? 40
//               : 30,
//           0,
//           0),
//       child: Center(
//         child: Container(
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 5, blurRadius: 5, offset: Offset(3, 3))]),
//           constraints: BoxConstraints(
//               maxHeight: !isMobile(context) ? DeviceSize.getHeight(context) * 0.8 : (DeviceSize.getWidth(context) * 0.9) * 1.25,
//               maxWidth: !isMobile(context) ? DeviceSize.getHeight(context) * 0.8 * 0.8 : DeviceSize.getWidth(context) * 0.9),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(15.0),
//             child: CupertinoPageScaffold(
//               child: SafeArea(
//                 child: CustomVideoPlayerWeb(customVideoPlayerWebController: _customVideoPlayerWebController),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
