import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../navItem.dart';
import '../style.dart';
import '../topbar.dart';
import '../bottonbar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

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
            children: [
              TopBar(),
              isDesktop(context)
                  ? Contact1Desktop()
                  : isTab(context)
                      ? Contact1Tab()
                      : Contact1Mobile(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact1Desktop extends StatelessWidget {
  const Contact1Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iw = DeviceSize.getWidth(context);
    double ih = iw * 0.3005;
    return Container(
      height: 1000,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/contact1.jpg',
              width: iw,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: (iw * 0.3005) * 0.3,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'ฝากข้อมูลการติดต่อของคุณ',
                    style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Text(
                    'เราจะติดต่อคุณโดยเร็วที่สุดและแนะนำคุณด้วยความกรุณา',
                    style: GoogleFonts.prompt(color: whiteColor, fontSize: 17.0),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: iw * 0.2,
            right: iw * 0.2,
            top: (iw * 0.3005) * 0.8,
            child: Container(
              width: iw * 0.6,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 250.0),
                          child: Image.asset(
                            'assets/images/circleicon.png',
                            width: iw * 0.2,
                          ),
                        ),
                        Container(
                          height: 1,
                          width: iw * 0.2,
                          color: home2Color,
                          constraints: BoxConstraints(maxWidth: 300.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PJ House',
                          style: GoogleFonts.prompt(
                            color: topBarTextColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'หากทิ้งเบอร์ติดต่อหรือ\nLine ID ไว้ เราจะติดต่อกลับไป',
                          style: GoogleFonts.prompt(),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('กรุณาฝากข้อมูลการติดต่อของคุณ', style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor),),
                        SizedBox(height: 20.0),
                        Container(
                          width: iw * 0.22,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'หมายเลขโทรศัพท์',
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.22,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'ไอดีไลน์',
                              prefixIcon: Icon(Icons.chat_bubble),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.22,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'ทุนโดยประมาณ',
                              prefixIcon: Icon(Icons.money),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          "Error",
                          style: GoogleFonts.prompt(color: Colors.redAccent),
                        ),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: whiteColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "ส่ง",
                                    style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.0,
                                  child: Icon(
                                    Icons.email,
                                    color: whiteColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Contact1Tab extends StatelessWidget {
  const Contact1Tab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Contact1Mobile extends StatelessWidget {
  const Contact1Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EditTextSet extends StatelessWidget {
  const EditTextSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
