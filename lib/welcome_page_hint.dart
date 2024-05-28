import 'package:flutter/material.dart';
import 'package:projectattempt/welcome_page.dart';
import 'text_expansion.dart';
import 'welcome_page.dart';

class WelcomePageHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              // Background Image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/1stlogoblurred.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Centered content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.2),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomePage()),
                        );
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.8,
                        height: constraints.maxHeight * 0.35,
                        padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(constraints.maxWidth * 0.1),
                        ),
                        child: Text(
                          "Your new workout companion! Imagine a gym partner who's always ready when you are, fits just like you, and knows exactly how to push you to your limits - that's WorkoutWhiz for you. Dive into a world where technology meets fitness, and discover how our cutting-edge AI can predict your lifting capabilities, tailor workout schedules to your goals, and motivate you by mirroring your every move. Ready to revolutionize your fitness journey? Let's get started!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.085),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TextExpansionPage()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: constraints.maxWidth * 0.34),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent,
                        ),
                        child: Text(
                          'Dive In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: constraints.maxWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TextExpansionPage()),
                        );
                      },
                      child: Text(
                        'DISCLAIMER',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: constraints.maxWidth * 0.04,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.purple,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TextExpansionPage()),
                        );
                      },
                      child: Text(
                        'Please ensure you engage in workouts within a safe and\nappropriate environment suited to your fitness level...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: constraints.maxWidth * 0.03,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
