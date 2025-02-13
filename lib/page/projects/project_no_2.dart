import 'package:flutter/material.dart';

import '../../bottonbar.dart';
import '../../navItem.dart';
import '../../style.dart';
import '../../topbar.dart';

class ProjectNo2Page extends StatelessWidget {
  const ProjectNo2Page({super.key});

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
              ProjectsNo2PageBody(),
              BottomBar()
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectsNo2PageBody extends StatelessWidget {
  const ProjectsNo2PageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
