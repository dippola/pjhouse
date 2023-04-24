import 'package:flutter/material.dart';
import 'package:pjhouse/page/about.dart';
import 'package:pjhouse/page/home.dart';
import 'package:pjhouse/page/project.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PJHouse());
}

class PJHouse extends StatelessWidget {
  const PJHouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PJ House',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/about": (context) => const AboutPage(),
        "/project": (context) => const ProjectPage()
      },
    );
  }
}

