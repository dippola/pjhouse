import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pjhouse/page/privacy_policy.dart';
import 'package:url_launcher/url_launcher.dart';

import '../navItem.dart';
import '../style.dart';
import '../text.dart';
import '../topbar.dart';
import '../bottonbar.dart';

final TextEditingController phonec = TextEditingController();
final TextEditingController linec = TextEditingController();
final TextEditingController moneyc = TextEditingController();
bool isLoading = false;
String errormsg = '';
final FocusNode _fnPhone = FocusNode();
final FocusNode _fnLine = FocusNode();
final FocusNode _fnMoney = FocusNode();

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_fnPhone.hasFocus) {
          _fnPhone.unfocus();
        }
        if (_fnLine.hasFocus) {
          _fnLine.unfocus();
        }
        if (_fnMoney.hasFocus) {
          _fnMoney.unfocus();
        }
      },
      onPanDown: (detail) {
        if (_fnPhone.hasFocus) {
          _fnPhone.unfocus();
        }
        if (_fnLine.hasFocus) {
          _fnLine.unfocus();
        }
        if (_fnMoney.hasFocus) {
          _fnMoney.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                ContactToMeDesktop(),
                ContactPrivacyPolicy(),
                BottomBar(),
              ],
            ),
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
    return Container(
      //전체
      height: ih + (450 - (ih * 0.2)) + 20,
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
                    contact1_1,
                    style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Text(
                    contact1_2,
                    style: GoogleFonts.prompt(color: whiteColor, fontSize: 17.0),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            // 여기서부터 흰색box
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
                          contact2_1,
                          style: GoogleFonts.prompt(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          contact2_2,
                          style: GoogleFonts.prompt(),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contact2_3,
                          style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: iw * 0.22,
                          child: TextField(
                            focusNode: _fnPhone,
                            controller: phonec,
                            decoration: InputDecoration(
                              hintText: contact2_4,
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.22,
                          child: TextField(
                            focusNode: _fnLine,
                            controller: linec,
                            decoration: InputDecoration(
                              hintText: contact2_5,
                              prefixIcon: Icon(Icons.chat_bubble),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.22,
                          child: TextField(
                            focusNode: _fnMoney,
                            controller: moneyc,
                            decoration: InputDecoration(
                              hintText: contact2_6,
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
                              backgroundColor: !isLoading ? topBarTextColor : Colors.grey),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (!isLoading) {
                              setState(() {
                                errormsg = '';
                                isLoading = true;
                              });
                              if (phonec.text == '' && linec.text == '') {
                                errormsg = contact2_7;
                              } else {
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
                                  await data.set({'phone': phonec.text, 'line': linec.text, 'money': moneyc.text});
                                  print('Firestore data saved successfully.');
                                  phonec.text = '';
                                  linec.text = '';
                                  moneyc.text = '';
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MyDialog();
                                      });
                                } catch (e) {
                                  print('Failed to save Firestore data: $e');
                                }
                              }
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              null;
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: whiteColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(
                                        contact2_8,
                                        style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: isLoading ? 1.0 : 0.0,
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        child: CircularProgressIndicator(
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
    return Container(
      //전체
      height: ih + (450 - (ih * 0.2)) + 20,
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
                    contact1_1,
                    style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Text(
                    contact1_2,
                    style: GoogleFonts.prompt(color: whiteColor, fontSize: 17.0),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            // 여기서부터 흰색box
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
                          contact2_1,
                          style: GoogleFonts.prompt(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          contact2_2,
                          style: GoogleFonts.prompt(),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contact2_3,
                          style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: iw * 0.32,
                          child: TextField(
                            focusNode: _fnPhone,
                            controller: phonec,
                            decoration: InputDecoration(
                              hintText: contact2_4,
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.32,
                          child: TextField(
                            focusNode: _fnLine,
                            controller: linec,
                            decoration: InputDecoration(
                              hintText: contact2_5,
                              prefixIcon: Icon(Icons.chat_bubble),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: iw * 0.32,
                          child: TextField(
                            focusNode: _fnMoney,
                            controller: moneyc,
                            decoration: InputDecoration(
                              hintText: contact2_6,
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
                              backgroundColor: !isLoading ? topBarTextColor : Colors.grey),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (!isLoading) {
                              setState(() {
                                errormsg = '';
                                isLoading = true;
                              });
                              if (phonec.text == '' && linec.text == '') {
                                errormsg = contact2_7;
                              } else {
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
                                  await data.set({'phone': phonec.text, 'line': linec.text, 'money': moneyc.text});
                                  print('Firestore data saved successfully.');
                                  phonec.text = '';
                                  linec.text = '';
                                  moneyc.text = '';
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MyDialog();
                                      });
                                } catch (e) {
                                  print('Failed to save Firestore data: $e');
                                }
                              }
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              null;
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: whiteColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(
                                        contact2_8,
                                        style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: isLoading ? 1.0 : 0.0,
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        child: CircularProgressIndicator(
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
    return Container(
      //전체
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
                    contact1_1,
                    style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 21.0),
                  ),
                  Text(
                    contact1_2,
                    style: GoogleFonts.prompt(color: whiteColor, fontSize: 16.0),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            // 여기서부터 흰색box
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
                      contact2_1,
                      style: GoogleFonts.prompt(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      contact2_2,
                      style: GoogleFonts.prompt(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      contact2_3,
                      style: GoogleFonts.prompt(fontSize: 17.0, fontWeight: FontWeight.bold, color: topBarTextColor),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: iw * 0.7,
                      child: TextField(
                        focusNode: _fnPhone,
                        controller: phonec,
                        decoration: InputDecoration(
                          hintText: contact2_4,
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: iw * 0.7,
                      child: TextField(
                        focusNode: _fnLine,
                        controller: linec,
                        decoration: InputDecoration(
                          hintText: contact2_5,
                          prefixIcon: Icon(Icons.chat_bubble),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: iw * 0.7,
                      child: TextField(
                        focusNode: _fnMoney,
                        controller: moneyc,
                        decoration: InputDecoration(
                          hintText: contact2_6,
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
                          backgroundColor: !isLoading ? topBarTextColor : Colors.grey),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (!isLoading) {
                          setState(() {
                            errormsg = '';
                            isLoading = true;
                          });
                          if (phonec.text == '' && linec.text == '') {
                            print(phonec.text);
                            print(linec.text);
                            errormsg = contact2_7;
                          } else {
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
                              await data.set({'phone': phonec.text, 'line': linec.text, 'money': moneyc.text});
                              print('Firestore data saved successfully.');
                              phonec.text = '';
                              linec.text = '';
                              moneyc.text = '';
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MyDialog();
                                  });
                            } catch (e) {
                              print('Failed to save Firestore data: $e');
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('filed: $e'),
                                duration: Duration(seconds: 10),
                              ));
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          null;
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: whiteColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    contact2_8,
                                    style: GoogleFonts.prompt(color: whiteColor, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Opacity(
                                  opacity: isLoading ? 1.0 : 0.0,
                                  child: Container(
                                    width: 20.0,
                                    height: 20.0,
                                    child: CircularProgressIndicator(
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
        SizedBox(
            height: isDesktop(context)
                ? 40.0
                : isTab(context)
                    ? 35.0
                    : 30.0),
        TextButton(
          onPressed: () {
            if (ModalRoute.of(context)!.settings.name != '/privacy_policy') {
              Navigator.pushNamed(context, '/privacy_policy');
            }
          },
          child: Text(
            contact_privacy_policy,
            style: GoogleFonts.prompt(color: Colors.blueAccent),
          ),
        ),
        SizedBox(height: 20.0)
      ],
    ));
  }
}

class ContactToMeDesktop extends StatelessWidget {
  const ContactToMeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // width: DeviceSize.getWidth(context) * 0.65,
          width: DeviceSize.getWidth(context) > 910 ? DeviceSize.getWidth(context) * 0.65 : DeviceSize.getWidth(context) * 0.9,
          child: DeviceSize.getWidth(context) >= 650 ? DesktopAndTab(context) : OnlyMobile(context)),
    );
  }

  Widget DesktopAndTab(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: home2Color, width: 1.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: topBarTextColor,
                    size: 50.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    contact3_1,
                    style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    pjhouse_phone_number,
                    style: GoogleFonts.prompt(),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: home2ColorLine), backgroundColor: logoBackgroundColor, padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
                    onPressed: () async {
                      await _callPhoneNumber();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.call,
                          color: topBarTextColor,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          contact3_1,
                          style: GoogleFonts.prompt(color: topBarTextColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: home2Color, width: 1.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/lineicon.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    contact3_2,
                    style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    pjhouse_line_id,
                    style: GoogleFonts.prompt(),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: home2ColorLine), backgroundColor: logoBackgroundColor, padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
                    onPressed: () async {
                      await _addLine(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_comment,
                          color: topBarTextColor,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          contact3_3,
                          style: GoogleFonts.prompt(color: topBarTextColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: home2Color, width: 1.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/facebookicon.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    contact3_4,
                    style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    contact3_5,
                    style: GoogleFonts.prompt(),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: home2ColorLine), backgroundColor: logoBackgroundColor, padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
                    onPressed: () async {
                      await _addFacebook(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_comment,
                          color: topBarTextColor,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          contact3_6,
                          style: GoogleFonts.prompt(color: topBarTextColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget OnlyMobile(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceSize.getWidth(context) * 0.6,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: home2Color, width: 1.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.call,
                  color: topBarTextColor,
                  size: 50.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  contact3_1,
                  style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  pjhouse_phone_number,
                  style: GoogleFonts.prompt(),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: home2ColorLine), backgroundColor: logoBackgroundColor, padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
                  onPressed: () async {
                    await _callPhoneNumber();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.call,
                        color: topBarTextColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        contact3_1,
                        style: GoogleFonts.prompt(color: topBarTextColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          width: DeviceSize.getWidth(context) * 0.6,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: home2Color, width: 1.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/lineicon.png',
                  width: 50.0,
                  height: 50.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  contact3_2,
                  style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  pjhouse_line_id,
                  style: GoogleFonts.prompt(),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: home2ColorLine), backgroundColor: logoBackgroundColor, padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
                  onPressed: () async {
                    await _addLine(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_comment,
                        color: topBarTextColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        contact3_3,
                        style: GoogleFonts.prompt(color: topBarTextColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          width: DeviceSize.getWidth(context) * 0.6,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: home2Color, width: 1.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/facebookicon.png',
                  width: 50.0,
                  height: 50.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  contact3_4,
                  style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  contact3_5,
                  style: GoogleFonts.prompt(),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: home2ColorLine), backgroundColor: logoBackgroundColor, padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
                  onPressed: () async {
                    await _addFacebook(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_comment,
                        color: topBarTextColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        contact3_6,
                        style: GoogleFonts.prompt(color: topBarTextColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _callPhoneNumber() async {
  final pn = pjhouse_phone_number;
  final url = 'tel:$pn';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $pn';
  }
}

Future<void> _addLine(BuildContext context) async {
  String lineId = pjhouse_line_id;
  final scheme = 'line://ti/p/@$lineId'; // 라인 앱 URL Scheme

  if (await canLaunch(scheme)) {
    await launch(scheme);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ไม่ได้ติดตั้งแอพ Line')),
    );
  }
}

Future<void> _addFacebook(BuildContext context) async {
  String id = 'PJ House บ้านเดี่ยวสระบุรี';
  final url = 'https://m.me/$id';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "การจองการให้คำปรึกษาเสร็จสมบูรณ์",
          style: GoogleFonts.prompt(color: topBarTextColor, fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
      ),
      content: Text(
        "เราจะติดต่อคุณโดยเร็วที่สุด\nขอขอบคุณที่ออกจากคำถามของคุณ",
        style: GoogleFonts.prompt(),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: TextButton(
            child: Text('ตรวจสอบ'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
