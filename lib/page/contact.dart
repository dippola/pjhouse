import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pjhouse/page/privacy_policy.dart';

import '../navItem.dart';
import '../style.dart';
import '../topbar.dart';
import '../bottonbar.dart';

final TextEditingController phonec = TextEditingController();
final TextEditingController linec = TextEditingController();
final TextEditingController moneyc = TextEditingController();
String errormsg = '';
bool isLoading = false;

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
              ContactPrivacyPolicy(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact1Desktop extends StatefulWidget {
  const Contact1Desktop({Key? key}) : super(key: key);

  @override
  State<Contact1Desktop> createState() => _Contact1DesktopState();
}

class _Contact1DesktopState extends State<Contact1Desktop> {
  @override
  Widget build(BuildContext context) {
    double iw = DeviceSize.getWidth(context);
    double ih = iw * 0.3005;
    return Container(//전체
      height: ih + (450-(ih*0.2)) + 20,
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
          Positioned(// 여기서부터 흰색box
            left: iw * 0.2,
            right: iw * 0.2,
            top: (iw * 0.3005) * 0.8,
            child: Container(
              width: iw * 0.6,
              height: 450.0,
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'กรุณาฝากข้อมูลการติดต่อของคุณ',
                          style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: iw * 0.22,
                          child: TextField(
                            controller: phonec,
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
                            controller: linec,
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
                            controller: moneyc,
                            decoration: InputDecoration(
                              hintText: 'ทุนโดยประมาณ (ตัวเลือก)',
                              prefixIcon: Icon(Icons.money),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          errormsg,
                          style: GoogleFonts.prompt(color: Colors.redAccent),
                        ),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await saveFirestore(phonec, linec, moneyc);
                            setState(() {
                              isLoading = false;
                            });
                          },
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
          ),
        ],
      ),
    );
  }
}

class Contact1Tab extends StatefulWidget {
  const Contact1Tab({Key? key}) : super(key: key);

  @override
  State<Contact1Tab> createState() => _Contact1TabState();
}

class _Contact1TabState extends State<Contact1Tab> {
  @override
  Widget build(BuildContext context) {
    double iw = DeviceSize.getWidth(context);
    double ih = iw * 0.3005;
    return Container(//전체
      height: ih + (450-(ih*0.2)) + 20,
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
          Positioned(// 여기서부터 흰색box
            left: iw * 0.1,
            right: iw * 0.1,
            top: (iw * 0.3005) * 0.8,
            child: Container(
              width: iw * 0.6,
              height: 430.0,
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
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'กรุณาฝากข้อมูลการติดต่อของคุณ',
                          style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: iw * 0.32,
                          child: TextField(
                            controller: phonec,
                            decoration: InputDecoration(
                              hintText: 'หมายเลขโทรศัพท์',
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.32,
                          child: TextField(
                            controller: linec,
                            decoration: InputDecoration(
                              hintText: 'ไอดีไลน์',
                              prefixIcon: Icon(Icons.chat_bubble),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.32,
                          child: TextField(
                            controller: moneyc,
                            decoration: InputDecoration(
                              hintText: 'ทุนโดยประมาณ (ตัวเลือก)',
                              prefixIcon: Icon(Icons.money),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          errormsg,
                          style: GoogleFonts.prompt(color: Colors.redAccent),
                        ),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await saveFirestore(phonec, linec, moneyc);
                            setState(() {
                              isLoading = false;
                            });
                          },
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
          ),
        ],
      ),
    );
  }
}

class Contact1Mobile extends StatefulWidget {
  const Contact1Mobile({Key? key}) : super(key: key);

  @override
  State<Contact1Mobile> createState() => _Contact1MobileState();
}

class _Contact1MobileState extends State<Contact1Mobile> {
  @override
  Widget build(BuildContext context) {
    double iw = DeviceSize.getWidth(context);
    double ih = iw * 0.3005;
    return Container(//전체
      // height: ih + (450-(ih*0.2)) + 20,
      height: ih + 700 + 15,
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
            top: (iw * 0.3005) * 0.25,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'ฝากข้อมูลการติดต่อของคุณ',
                    style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 21.0),
                  ),
                  Text(
                    'เราจะติดต่อคุณโดยเร็วที่สุดและแนะนำคุณด้วยความกรุณา',
                    style: GoogleFonts.prompt(color: whiteColor, fontSize: 16.0),
                  )
                ],
              ),
            ),
          ),
          Positioned(// 여기서부터 흰색box
            left: iw * 0.07,
            right: iw * 0.07,
            height: 700.0,
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
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 250.0, minWidth: 230),
                      child: Image.asset(
                        'assets/images/circleicon.png',
                        width: iw * 0.5,
                      ),
                    ),
                    Container(
                      height: 1,
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
                    ),
                    Text(
                      'กรุณาฝากข้อมูลการติดต่อของคุณ',
                      style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: iw * 0.7,
                      child: TextField(
                        controller: phonec,
                        decoration: InputDecoration(
                          hintText: 'หมายเลขโทรศัพท์',
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: iw * 0.7,
                      child: TextField(
                        controller: linec,
                        decoration: InputDecoration(
                          hintText: 'ไอดีไลน์',
                          prefixIcon: Icon(Icons.chat_bubble),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: iw * 0.7,
                      child: TextField(
                        controller: moneyc,
                        decoration: InputDecoration(
                          hintText: 'ทุนโดยประมาณ (ตัวเลือก)',
                          prefixIcon: Icon(Icons.money),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      errormsg,
                      style: GoogleFonts.prompt(color: Colors.redAccent),
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await saveFirestore(phonec, linec, moneyc);
                        setState(() {
                          isLoading = false;
                        });
                      },
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
                    ),
                    SizedBox(height: 10.0)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactPrivacyPolicy extends StatelessWidget {
  const ContactPrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: isDesktop(context) ? 40.0 : isTab(context) ? 25.0 : 15.0),
          TextButton(
            onPressed: () {
              if (ModalRoute.of(context)!.settings.name != '/privacy_policy') {
                Navigator.pushNamed(context, '/privacy_policy');
              }
            },
            child: Text(
              'นโยบายความเป็นส่วนตัว',
              style: GoogleFonts.prompt(color: Colors.blueAccent),
            ),
          ),
          SizedBox(height: 20.0)
        ],
      )
    );
  }
}

Future<void> saveFirestore(TextEditingController phone, TextEditingController line, TextEditingController money) async {
  if (phone.text == '' || line.text == '') {
    errormsg = "กรุณากรอกเบอร์โทรหรือไลน์ไอดี";
  } else {
    errormsg = '';
    String now = DateTime.now().toString();
    print(now);
    CollectionReference reference = FirebaseFirestore.instance.collection('contact');
    DocumentReference data = reference.doc(now);
    // await data.set({
    //   'phone': phone,
    //   'line': line,
    //   'money': money
    // }).then((value) => 'successed').catchError((error) => print("failed: " + error.toString()));

    try {
      await data.set({'phone': phone.text, 'line': line.text, 'money': money.text});
      print('Firestore data saved successfully.');
      phone.text = '';
      line.text = '';
      money.text = '';
    } catch (e) {
      print('Failed to save Firestore data: $e');
    }
  }
}
