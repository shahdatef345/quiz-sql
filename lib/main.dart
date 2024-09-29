import 'package:exam_app/screens/quiz_screen.dart';
import 'package:exam_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const WelcomeScreen(),
        "quiz_screen": (context) => const QuizScreen(),
        "result_screen": (context) => const ResultScreen(),
      },
    );
  }
}
