import 'package:flutter/material.dart';
import 'package:landing_page/screen/HomeScreen.dart';
import 'package:landing_page/screen/SurveyForm2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duolingo Clone',
      routes: {
        '/': (context) => const HomeScreen(),
        '/getStarted': (context) => SurveyFormMaterial(),
      },
    );
  }
}
