import 'package:flutter/material.dart';
import 'package:pjhouse/style.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isDesktop(context)) {
        return TopBarDesktop();
      } else if (isTab(context)) {
        return TopBarDesktop();
      } else if (isMobile(context)) {
        return TopBarMobile();
      } else {
        return TopBarMobile();
      }
    });
  }
}

class TopBarDesktop extends StatelessWidget {
  const TopBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: DeviceSize.getWidth(context) > 700 ? EdgeInsets.symmetric(vertical: 20, horizontal: 40) : EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                if (ModalRoute.of(context)!.settings.name != '/') {
                  Navigator.pushNamed(context, '/');
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/titleicon1.png',
                    width: 60.0,
                    height: 60.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  desktopTopBarTitleTextStyle(context)
                ],
              ),
            ),
            Row(
              children: [
                TopBarDeskTopButton(
                    text: text_home,
                    click: () {
                      if (ModalRoute.of(context)!.settings.name != '/') {
                        Navigator.pushNamed(context, '/');
                      }
                    }),
                TopBarDeskTopButton(
                    text: text_aboutus,
                    click: () {
                      if (ModalRoute.of(context)!.settings.name != '/about') {
                        Navigator.pushNamed(context, '/about');
                      }
                    }),
                TopBarDeskTopButton(
                    text: text_project,
                    click: () {
                      if (ModalRoute.of(context)!.settings.name != '/project') {
                        Navigator.pushNamed(context, '/project');
                      }
                    }),
                TopBarDeskTopButton(
                    text: text_contact,
                    click: () {
                      if (ModalRoute.of(context)!.settings.name != '/contact') {
                        Navigator.pushNamed(context, '/contact');
                      }
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TopBarMobile extends StatelessWidget {
  const TopBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMoreSmall(BuildContext context) =>
        MediaQuery.of(context).size.width < 319;
    return Container(
      child: Padding(
          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          padding: !isMoreSmall(context)
              ? EdgeInsets.symmetric(vertical: 20, horizontal: 40)
              : EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.0,
                child: Icon(
                  Icons.menu,
                  size: 20.0,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (ModalRoute.of(context)!.settings.name != '/') {
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/titleicon1.png',
                      width: 35.0,
                      height: 35.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    desktopTopBarTitleTextStyle(context)
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: topBarTextColor,
                  ))
            ],
          )),
    );
  }
}

class TopBarDeskTopButton extends StatelessWidget {
  const TopBarDeskTopButton({Key? key, required this.text, required this.click})
      : super(key: key);

  final String text;
  final GestureTapCallback click;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextButton(
              onPressed: click,
              child: Text(
                text,
                style: desktopTopBarButtonTextStyle(false),
              ),
            ),
          ],
        ));
  }
}
