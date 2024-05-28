import 'package:flutter/material.dart';
import 'package:projectattempt/welcome_page.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered Logo with rounded edges and click navigation
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35.0), // Adjust as needed
                child: Image.asset(
                  'assets/images/1stlogo.png',
                  width: 125, // Adjust the width as needed
                  height: 125, // Adjust the height as needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
