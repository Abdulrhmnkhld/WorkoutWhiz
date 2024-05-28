import 'package:flutter/material.dart';
import 'package:projectattempt/virtual_coach_1.dart';
import 'todays_workout.dart';
import 'whizchat.dart';
import 'home.dart';

class WorkoutPlansPage extends StatefulWidget {
  final int i;
  final int j;

  WorkoutPlansPage({required this.i, required this.j});

  @override
  _WorkoutPlansPageState createState() => _WorkoutPlansPageState();
}

class _WorkoutPlansPageState extends State<WorkoutPlansPage> {
  bool muscleSplitChecked = true;
  bool broSplitChecked = false;

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: constraints.maxHeight * 0.02),
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
                            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
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
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to Home page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TodaysWorkoutPage()),
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
                          SizedBox(height: constraints.maxHeight * 0.03),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
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
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: muscleSplitChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          muscleSplitChecked = value!;
                                          broSplitChecked = !value; // Ensure only one is checked
                                        });
                                      },
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                    ),
                                    Text(
                                      'Muscle split',
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.045,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.035,
                                        color: Colors.white70),
                                    children: [
                                      TextSpan(text: '          Chest & Triceps\n'),
                                      TextSpan(text: '          Back & Biceps\n'),
                                      TextSpan(text: '          Shoulders & Traps\n'),
                                      TextSpan(text: '          Legs & Abs\n'),
                                      TextSpan(text: '          Shoulders & traps\n'),
                                      TextSpan(text: '          Rest Day\n'),
                                      TextSpan(text: '\n'),
                                      TextSpan(text: '          '),
                                      TextSpan(
                                        text: 'Repeat the cycle',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
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
                                Row(
                                  children: [
                                    Checkbox(
                                      value: broSplitChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          broSplitChecked = value!;
                                          muscleSplitChecked = !value; // Ensure only one is checked
                                        });
                                      },
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                    ),
                                    Text(
                                      'Bro split',
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.045,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.035,
                                        color: Colors.white70),
                                    children: [
                                      TextSpan(text: '          Chest\n'),
                                      TextSpan(text: '          Back\n'),
                                      TextSpan(text: '          Shoulders\n'),
                                      TextSpan(text: '          Legs\n'),
                                      TextSpan(text: '          Shoulders & traps\n'),
                                      TextSpan(text: '          Arms\n'),
                                      TextSpan(text: '          Rest Day\n'),
                                      TextSpan(text: '\n'),
                                      TextSpan(text: '          '),
                                      TextSpan(
                                        text: 'Repeat the cycle',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
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
                    SizedBox(height: constraints.maxHeight * 0.02),
                  ],
                ),
              ),
              // Shadow for Bottom Navigation Bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: constraints.maxHeight * 0.02,
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
                              MaterialPageRoute(builder: (context) => VirtualCoach1(i: widget.i, j: widget.j)),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.025),
                            child: Icon(Icons.person, color: Colors.white, size: constraints.maxWidth * 0.09),
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
                            // Navigate to chat page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WhizChatPage()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.025),
                            child: Icon(Icons.chat_rounded, color: Colors.white, size: constraints.maxWidth * 0.09),
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
