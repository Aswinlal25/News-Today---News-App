// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diary/presentation/home_screen/home.dart';
import 'package:my_diary/presentation/utiles/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroung_image.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.87,
              left: screenSize.width * 0.42,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kblue, width: 3),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          padding: EdgeInsets.zero, // Remove padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: SizedBox(
                          height: screenSize.height * 0.06,
                          width: screenSize.width * 0.5, // Adjust button width
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Explore',
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.04,
                                    color: kwhite,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                kwith10,
                                const Icon(
                                  Icons.arrow_forward,
                                  color: kblue,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: screenSize.height * 0.25,
                left: 10,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Stay Ahead with Top\nNews from India\t\n',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.09,
                          color: kwhite,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Stay informed and stay ahead with our up-to-the\nminute coverage. Your ultimate source for\nthe latest news',
                        style: TextStyle(
                          fontSize: screenSize.width *
                              0.033, // Adjust the font size here
                          color: kwhite,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: screenSize.height * 0.2,
                left: screenSize.width * 0.57,
                child: Transform.rotate(
                  angle: -90 *
                      3.1415926535 /
                      180, // Rotate 90 degrees counterclockwise
                  child: Text(
                    'News Today',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.12,
                      color: Colors.white24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                )),
            Positioned(
              right: screenSize.width * 0.57,
              bottom: screenSize.height * 0.87,
              child: Stack(
                children: [
                  Text(
                    'N        ',
                    style: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        wordSpacing: 1,
                        fontSize: 53),
                  ),
                  Positioned(
                    top: 16,
                    left: 40,
                    child: Text(
                      'EWS',
                      style: TextStyle(
                          color: kwhite,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: 18),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 40,
                    child: Text(
                      'TODAY',
                      style: TextStyle(
                          color: kwhite,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
