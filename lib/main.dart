import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_choice_widget/app_scaffold.dart';
import 'package:multi_choice_widget/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.bricolageGrotesqueTextTheme(),
        useMaterial3: true,
      ),
      home: const IntroPage()
      // If you want to skip the intro page and go directly to the app with navbar:
      // home: const AppScaffold()
    );
  }
}


