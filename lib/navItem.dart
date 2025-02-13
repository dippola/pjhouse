import 'package:flutter/material.dart';
import 'package:pjhouse/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjhouse/strings.dart';

class NavItem extends StatelessWidget {
  const NavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20.0),
              NavItems(title: text_home, tapEvent: () {
                Navigator.of(context).pop();
                if (ModalRoute.of(context)!.settings.name != '/') {
                  Navigator.pushNamed(context, '/');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: text_aboutus, tapEvent: () {
                Navigator.of(context).pop();
                if (ModalRoute.of(context)!.settings.name != '/about') {
                  Navigator.pushNamed(context, '/about');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: text_project, tapEvent: () {
                Navigator.of(context).pop();
                if (ModalRoute.of(context)!.settings.name != '/project/no1') {
                  Navigator.pushNamed(context, '/project/no1');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: bottombar_contact, tapEvent: () {
                Navigator.of(context).pop();
                if (ModalRoute.of(context)!.settings.name != '/contact') {
                  Navigator.pushNamed(context, '/contact');
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class NavItems extends StatelessWidget {
  const NavItems({Key? key, required this.title, required this.tapEvent})
      : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: tapEvent, child: Text(title, style: GoogleFonts.kanit(color: Colors.black87)));
  }
}
