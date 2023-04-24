import 'package:flutter/material.dart';
import 'package:pjhouse/style.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return (!isMobile(context) ? DesktopBottom() : MobileBottom());
    return Column(
      children: [
        // !isMobile(context) ? DesktopBottom() : MobileBottom(),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 1.0,
          width: DeviceSize.getWidth(context),
          color: home2Color,
        ),
        SizedBox(
          height: 20.0,
        ),
        BottomAbout(),
        SizedBox(
          height: 50.0,
        )
      ],
    );
  }
}

class BottomAbout extends StatelessWidget {
  const BottomAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return isMobile(context) ? AboutMobile() : isDesktop(context) ? AboutDeskTop() : AboutMobile();
    return isDesktop(context) ? AboutDesktop() : isTab(context) ? AboutTab() : AboutMobile();
  }

  Widget AboutDesktop() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutDetail1(),
          SizedBox(
            width: 100.0,
          ),
          AboutDetail2(),
          SizedBox(
            width: 100.0,
          ),
          AboutDetail3(),
        ],
      ),
    );
  }

  Widget AboutTab() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutDetail1(),
          SizedBox(
            width: 30.0,
          ),
          AboutDetail2(),
          SizedBox(
            width: 30.0,
          ),
          AboutDetail3(),
        ],
      ),
    );
  }

  Widget AboutMobile() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutDetail1(),
          SizedBox(height: 15.0),
          AboutDetail2(),
          SizedBox(height: 15.0),
          AboutDetail3(),
        ],
      ),
    );
  }
}

class AboutDetail1 extends StatelessWidget {
  const AboutDetail1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            text_contact,
            style: bottomAboutTextColor1(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email : '),
            AboutDetailButton(text: pjhouse_email, click: () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Phone Number : '),
            AboutDetailButton(text: pjhouse_phone_number, click: () {}),
          ],
        )
      ],
    );
  }
}

class AboutDetail2 extends StatelessWidget {
  const AboutDetail2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            text_info,
            style: bottomAboutTextColor1(),
          ),
        ),
        AboutDetailButton(text: text_home, click: () {}),
        AboutDetailButton(text: text_aboutus, click: () {}),
        AboutDetailButton(text: text_project, click: () {}),
        AboutDetailButton(text: text_message, click: () {}),
      ],
    );
  }
}

class AboutDetail3 extends StatelessWidget {
  const AboutDetail3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            text_new_home_project,
            style: bottomAboutTextColor1(),
          ),
        ),
        AboutDetailButton(text: text_saraburi_project, click: () {}),
      ],
    );
  }
}

class AboutDetailButton extends StatelessWidget {
  const AboutDetailButton({Key? key, required this.text, required this.click}) : super(key: key);

  final String text;
  final GestureTapCallback click;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: click,
      child: Text(
        text,
        style: bottomAboutTextColor2(),
      ),
      style: TextButton.styleFrom(
        padding: !isMobile(context) ? EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0) : null,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
