import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Ensure the correct import path
import 'package:stroke_text/stroke_text.dart';
import 'signup_page.dart';
import 'home.dart';
import 'todays_workout.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}
