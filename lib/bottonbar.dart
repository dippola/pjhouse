import 'package:flutter/material.dart';
import 'package:pjhouse/style.dart';
import 'package:pjhouse/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';

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
          height: 30.0,
        ),
        BottomLicense()
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
            bottombar_contact,
            style: bottomAboutTextColor1(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email : '),
            AboutDetailButton(text: pjhouse_email, click: () {
              _sendEmail();
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Phone Number : '),
            AboutDetailButton(text: pjhouse_phone_number, click: () {
              _callPhoneNumber();
            }),
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
            bottombar_info,
            style: bottomAboutTextColor1(),
          ),
        ),
        AboutDetailButton(text: text_home, click: () {
          if (ModalRoute.of(context)!.settings.name != '/') {
            Navigator.pushNamed(context, '/');
          }
        }),
        AboutDetailButton(text: text_aboutus, click: () {
          if (ModalRoute.of(context)!.settings.name != '/about') {
            Navigator.pushNamed(context, '/about');
          }
        }),
        AboutDetailButton(text: text_project, click: () {
          if (ModalRoute.of(context)!.settings.name != '/projects') {
            Navigator.pushNamed(context, '/projects');
          }
        }),
        AboutDetailButton(text: text_message, click: () {
          if (ModalRoute.of(context)!.settings.name != '/contact') {
            Navigator.pushNamed(context, '/contact');
          }
        }),
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
            bottombar_new_project,
            style: bottomAboutTextColor1(),
          ),
        ),
        AboutDetailButton(text: text_saraburi_project, click: () {
          if (ModalRoute.of(context)!.settings.name != '/projects') {
            Navigator.pushNamed(context, '/projects');
          }
        }),
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

class BottomLicense extends StatelessWidget {
  const BottomLicense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
      child: Center(
        child: Text(license, style: GoogleFonts.prompt(fontSize: 13.0)),
      ),
    );
  }
}


Future<void> _callPhoneNumber() async {
  final pn = pjhouse_phone_number;
  final url = 'tel:$pn';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    FlutterClipboard.copy(pn).then(( value ) => print('คุณได้คัดลอกหมายเลขโทรศัพท์ของคุณ'));//phone number copy
  }
}

void _sendEmail() async {
  final email = pjhouse_email; // 수신자 이메일 주소 입력
  final subject = 'สอบถามโครงการบ้าน'; // 이메일 제목 입력
  final body = ''; // 이메일 내용 입력
  final url = 'mailto:$email?subject=$subject&body=$body';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'ไม่สามารถเปิดแอปอีเมลได้';
  }
}