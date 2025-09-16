import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bottom_nav_app_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/splash_screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home:
          //this for real navigation
           SplashScreen(),
          //for testing only
         // BottomNavAppBar(),
    );
  }
}
