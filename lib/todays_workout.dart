import 'package:flutter/material.dart';
import 'workout_plans.dart';
import 'whizchat.dart';
import 'virtual_coach_1.dart';
import 'home.dart';

class TodaysWorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int i = 0; // Initialize i
    int j = 0; // Initialize j
    return Scaffold(
        extendBody: true, // Ensures the body extends behind the navigation bar
        backgroundColor: Colors.transparent, // Ensure no white background
        body: LayoutBuilder(
        builder: (context, constraints) {
      return Stack(
          children: <Widget>[
      // Background Image
      Container(
      decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/images/homebackground.png'),
    fit: BoxFit.cover,
    ),
    ),
    ),
    // Centered content
    Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    SizedBox(height: constraints.maxHeight * 0.1),
    Text(
    'Welcome',
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.08,
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
    SizedBox(height: constraints.maxHeight * 0.01),
    Container(
    margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Expanded(
    child: Divider(
    color: Colors.white,
    thickness: 2.5,
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Text(
    'Abdul',
    style: TextStyle(
    color: Colors.white,
    fontSize: constraints.maxWidth * 0.04,
    ),
    ),
    ),
    Expanded(
    child: Divider(
    color: Colors.white,
    thickness: 2.5,
    ),
    ),
    ],
    ),
    ),
    SizedBox(height: constraints.maxHeight * 0.03),
    Container(
    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
    child: Column(
    children: [
    GestureDetector(
    onTap: () {
    // Navigate to Home page
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
    );
    },
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    "Today's Workout",
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.06,
    color: Colors.white,
    ),
    ),
    Icon(
    Icons.fitness_center,
    size: constraints.maxWidth * 0.06,
    color: Colors.white,
    ),
    ],
    ),
    ),
    SizedBox(height: constraints.maxHeight * 0.01),
    Align(
    alignment: Alignment.centerLeft,
    child: Container(
    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.03),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Chest',
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.05,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    decorationThickness: 2.7,
    ),
    ),
    SizedBox(height: constraints.maxHeight * 0.005),
    Text(
    ' Incline DB press\n Flat Machine press\n H to L cable Flies\n L to H Cable Flies',
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.04,
    color: Colors.white,
    ),
    ),
    ],
    ),
    ),
    SizedBox(width: constraints.maxWidth * 0.05),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Triceps',
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.05,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    decorationThickness: 2.7,
    ),
    ),
    SizedBox(height: constraints.maxHeight * 0.005),
    Text(
    ' Skull crushers\n Tricep extensions',
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.04,
    color: Colors.white,
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    SizedBox(height: constraints.maxHeight * 0.02),
    Align(
    alignment: Alignment.center,
    child: Text(
    '4 SETS TILL FAILURE',
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.05,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    decorationThickness: 2.7,
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    SizedBox(height: constraints.maxHeight * 0.03),
    GestureDetector(
    onTap: () {
    // Navigate to Workout Plans page
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WorkoutPlansPage(i: i, j: j)),
    );
    },
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    'Workout plans',
    style: TextStyle(
    fontSize: constraints.maxWidth * 0.06,
    color: Colors.white,
    ),
    ),
    Icon(
    Icons.list_alt,
      size: constraints.maxWidth * 0.06,
      color: Colors.white,
    ),
    ],
    ),
    ),
    ],
    ),
    ),
      SizedBox(height: constraints.maxHeight * 0.03),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
          child: Text(
            'Progress Snapshot',
            style: TextStyle(
              fontSize: constraints.maxWidth * 0.06,
              color: Colors.white,
            ),
          ),
        ),
      ),
      SizedBox(height: constraints.maxHeight * 0.01),
    ],
    ),
    ),
            // Shadow for Bottom Navigation Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, -3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ],
      );
        },
        ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight * 0.12, // Adjust height to ensure enough space for shadow and larger circle
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, -3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.indigo.withOpacity(0.3),
                          Colors.deepPurple.withOpacity(0.7),
                          Colors.purple.withOpacity(0.7),
                          Colors.black.withOpacity(0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    items: [
                      BottomNavigationBarItem(
                        icon: GestureDetector(
                          onTap: () {
                            // Navigate to Profile page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VirtualCoach1(i: i, j: j)),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.025),
                            child: Icon(Icons.person, color: Colors.white, size: constraints.maxWidth * 0.07),
                          ),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: GestureDetector(
                          onTap: () {
                            // Navigate to Home page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(constraints.maxWidth * 0.025), // Adjust padding for larger circle
                            child: Icon(Icons.home, color: Colors.white, size: constraints.maxWidth * 0.15),
                          ),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: GestureDetector(
                          onTap: () {
                            // Navigate to whizchat
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WhizChatPage()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.025),
                            child: Icon(Icons.chat_rounded, color: Colors.white, size: constraints.maxWidth * 0.07),
                          ),
                        ),
                        label: '',
                      ),
                    ],
                    onTap: (index) {
                      // Handle navigation tap
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
