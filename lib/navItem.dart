import 'package:flutter/material.dart';
import 'package:pjhouse/style.dart';
import 'package:google_fonts/google_fonts.dart';

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
                if (ModalRoute.of(context)!.settings.name != '/home') {
                  Navigator.pushNamed(context, '/home');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: text_aboutus, tapEvent: () {
                if (ModalRoute.of(context)!.settings.name != '/about') {
                  print("A");
                  Navigator.pushNamed(context, '/about');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: text_project, tapEvent: () {
                if (ModalRoute.of(context)!.settings.name != '/project') {
                  Navigator.pushNamed(context, '/project');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: text_contact, tapEvent: () {
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
    // return InkWell(
    //   onTap: tapEvent,
    //   hoverColor: Colors.blueGrey, //transparent
    //   child: SelectableText(
    //     title,
    //     style: TextStyle(fontWeight: FontWeight.w300),
    //   ),
    // );
    return TextButton(onPressed: tapEvent, child: Text(title, style: GoogleFonts.prompt(color: Colors.black87)));
  }
}
