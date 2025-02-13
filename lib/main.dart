import 'package:flutter/material.dart';
import 'package:pjhouse/page/about.dart';
import 'package:pjhouse/page/home.dart';
import 'package:pjhouse/page/privacy_policy.dart';
import 'package:pjhouse/page/projects/project_no_1.dart';
import 'package:pjhouse/page/projects/project_no_2.dart';
import 'package:pjhouse/page/projects/projects.dart';
import 'package:pjhouse/page/contact.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:pjhouse/style.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  usePathUrlStrategy();
  runApp(const PJHouse());
}

class PJHouse extends StatelessWidget {
  const PJHouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green, primarySwatch: Colors.green),
      title: 'PJ House',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/about": (context) => const AboutPage(),
        "/projects": (context) => const ProjectsPage(),
        "/project/no1": (context) => const ProjectNo1Page(),
        "/project/no2": (context) => const ProjectNo2Page(),
        "/contact": (context) => const ContactPage(),
        "/privacy_policy": (context) => const PrivacyPolicyPage()
      },
    );
  }
}