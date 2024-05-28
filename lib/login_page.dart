import 'package:flutter/material.dart';
import 'package:projectattempt/home.dart';
import 'package:projectattempt/signup_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool? rememberMe = false; // State management variable for the checkbox

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              // Background Image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/3rdlogoblurred.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Centered content
              Center(
                child: SingleChildScrollView( // Use SingleChildScrollView to avoid overflow issues
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: constraints.maxHeight * 0.1),
                      Text(
                        'Login',
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
                      SizedBox(height: constraints.maxHeight * 0.03),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your Google sign-in logic here
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/googlelogo.png', // Ensure this path is correct
                                      height: constraints.maxWidth * 0.06,
                                      width: constraints.maxWidth * 0.06,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: constraints.maxWidth * 0.04,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 2.5,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'or Sign in with Email',
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
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(color: Colors.white54),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(color: Colors.white54),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: rememberMe,
                                      onChanged: (bool? value) {
                                        rememberMe = value;
                                      },
                                      checkColor: Colors.white,
                                      activeColor: Colors.purple,
                                    ),
                                    Text(
                                      'Remember me',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Add your forgot password logic here
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage())
                                ); // Navigate to home page
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: constraints.maxWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Text(
                              'By Continuing you\'re accepting our terms and\nconditions and our privacy policy.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70, fontSize: constraints.maxWidth * 0.03),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(color: Colors.white, fontSize: constraints.maxWidth * 0.04),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignupPage())); // Navigate to signup page
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      decorationThickness: 2,
                                      fontSize: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
