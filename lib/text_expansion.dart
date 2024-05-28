import 'package:flutter/material.dart';
import 'package:projectattempt/login_page.dart';
import 'welcome_page.dart';
import 'welcome_page_hint.dart';

class TextExpansionPage extends StatelessWidget {
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(height: constraints.maxHeight * 0.3),
                                Text(
                                  'Welcome To',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.06,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: constraints.maxHeight * 0.006),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'WorkoutWhiz',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.06,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 10.0,
                                            color: Colors.black,
                                            offset: Offset(2.0, 2.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => WelcomePageHint()),
                                        );
                                      },
                                      child: Icon(
                                          Icons.lightbulb,
                                          size: constraints.maxWidth * 0.06,
                                          color: Colors.yellowAccent
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Text(
                      'Your ultimate virtual gym partner and\npersonal lifting coach!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.085),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
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
                          MaterialPageRoute(builder: (context) => WelcomePage()),
                        );
                      },
                      child: Text(
                        'Please ensure you engage in workouts within a safe and\nappropriate environment suited to your fitness level.\nWorkoutWhiz is here to guide and motivate, but all physical\nactivities should be performed at your own risk.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: constraints.maxWidth * 0.03,
                          shadows: [
                            Shadow(
                              blurRadius: 20.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
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
