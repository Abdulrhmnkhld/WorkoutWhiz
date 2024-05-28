import 'package:flutter/material.dart';
import 'welcome_page_hint.dart';
import 'text_expansion.dart';
import 'package:stroke_text/stroke_text.dart';

class WelcomePage extends StatelessWidget {
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
