import 'package:flutter/material.dart';

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
    return const Placeholder();
  }
}

class ProjectDetailTab extends StatelessWidget {
  const ProjectDetailTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProjectDetailMobile extends StatelessWidget {
  const ProjectDetailMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
