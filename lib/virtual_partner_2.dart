import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
import 'whizchat.dart';
import 'virtual_coach_1.dart';

class VirtualPartner2 extends StatefulWidget {
  final int initialSeconds;
  final int i;
  final int j;
  final int VP_j;

  VirtualPartner2({required this.initialSeconds, required this.i, required this.j, required this.VP_j});

  @override
  _VirtualPartner2State createState() => _VirtualPartner2State();
}

class _VirtualPartner2State extends State<VirtualPartner2> with SingleTickerProviderStateMixin {
  Timer? timer;
  late int seconds;
  late AnimationController _controller;
  //int VPreps = reps[widget.j];
  @override
  void initState() {
    super.initState();
    seconds = widget.initialSeconds;
    startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        _controller.forward(from: 0);  // Reset the animation to sync with the timer
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String get timerText {
    int minutes = seconds ~/ 60;
    int displaySeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${displaySeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    List<String> exercises = [
      "Incline DB press",
      "Flat Machine press",
      "H to L cable Flies",
      "L to H Cable Flies",
      "Skull crushers",
      "Tricep extensions"
    ];
    List<int> reps = [14, 12, 10, 8];
    List<int> weights = [32, 34, 36, 38];
    int task_weight = weights[widget.j];
    int task_reps = reps[widget.j];
    int VPreps = reps[widget.VP_j] - 2;
    int VPweight = weights[widget.VP_j] + 4;
    String exercise = exercises[widget.i % exercises.length];

    if (widget.VP_j >= 8){
      String VP_weight, task_weight = "MID";
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF1C1A26),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Image.asset(
                      'assets/images/virtual_partner_icon.png',
                      width: constraints.maxWidth * 0.12,
                      height: constraints.maxWidth * 0.12,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Text(
                      'Virtual Partner',
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
                    SizedBox(height: constraints.maxHeight * 0.037),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.087),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'EXERCISE',
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.05,
                                  color: Colors.purple[300],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                              Text(
                                exercise,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'VP STATS',
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.05,
                                  color: Colors.purple[300],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: VPreps.toString(),
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.05,
                                        color: Colors.purple[300],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' REPS',
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.05,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                              Container(
                                width: constraints.maxWidth * 0.15,
                                height: constraints.maxHeight * 0.005,
                                color: Colors.white,
                              ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: VPweight.toString(),
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.05,
                                        color: Colors.purple[300],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' KGS',
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.05,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.07),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => VirtualCoach1(i: widget.i, j: widget.j))
                        );
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxWidth * 0.3,
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1A26),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              timerText,
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.05,
                                color: Colors.purple[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.01),
                            Container(
                              width: constraints.maxWidth * 0.15,
                              height: constraints.maxHeight * 0.005,
                              color: Colors.white,
                            ),
                            SizedBox(height: constraints.maxHeight * 0.01),
                            Text(
                              'NEXT',
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.05,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '*Partner Name* finished his set!',
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Text(
                      'Press next when you’re done with your rest',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.035,
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white70,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
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
                            child: Icon(Icons.person, color: Colors.white, size: constraints.maxWidth * 0.15),
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
                            padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.025),
                            child: Icon(Icons.home, color: Colors.white, size: constraints.maxWidth * 0.07),
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
