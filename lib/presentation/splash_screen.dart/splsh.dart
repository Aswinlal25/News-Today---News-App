import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_diary/presentation/login_screen/login.dart';
import 'package:my_diary/presentation/utiles/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kdark,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:
                          Colors.blue, // Set your desired underline color here
                      width: 2.0, // Set the thickness of the underline
                    ),
                  ),
                ),
                child: const Stack(
                  children: [
                    Text(
                      'N        ',
                      style: TextStyle(
                          color: kwhite,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: 63),
                    ),
                    Positioned(
                      top: 16,
                      left: 45,
                      child: Text(
                        'EWS',
                        style: TextStyle(
                            color: kwhite,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            fontSize: 25),
                      ),
                    ),
                    Positioned(
                      top: 39,
                      left: 45,
                      child: Text(
                        'TODAY',
                        style: TextStyle(
                            color: kwhite,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
