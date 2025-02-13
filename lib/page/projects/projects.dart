import 'dart:js';
import 'dart:ui_web';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjhouse/page/project_img_dialog.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../bottonbar.dart';
import '../../navItem.dart';
import '../../style.dart';
import '../../strings.dart';
import '../../topbar.dart';
import '../home.dart';

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
          Text(
            "Introduce PJ House Projects",
            style: bottomAboutTextColor2(),
          ),
          Semantics(
            child: SelectableText(
              "Introduce PJ House Projects",
              style: bottomAboutTextColor2(),
            ),
          )
        ],
      ),
    );
  }
}
