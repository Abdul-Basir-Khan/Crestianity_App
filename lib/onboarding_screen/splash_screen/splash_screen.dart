import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bottom_nav_app_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/registeration_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const RegistrationScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/home_screen/splash.png"),fit: BoxFit.cover,)
          ),
          child:
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 120,),
              Image.asset("assets/home_screen/logo.png"),
              Text(
                'myChristianity',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF664F42),
                  fontSize: 36,
                  fontFamily: 'Quintessential',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
    );
  }
}
