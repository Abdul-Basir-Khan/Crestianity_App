import 'package:flutter/material.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/welcome_screen.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class RegistrationScreenOne extends StatelessWidget {
  const RegistrationScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAEB),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              'Help us grow',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF664F42),
                fontSize: 40,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Show your love by leaving a review on the app store',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30),
            Image.asset("assets/home_screen/logo.png"),
            SizedBox(
              height: 28,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: SvgPicture.asset(
                            "assets/onboarding_screen/star.svg"),
                      )),
            ),
            Spacer(),
            CustomButton(onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (_, animation, secondaryAnimation) => WelcomeScreen(),
                  transitionsBuilder: (_, animation, __, child) {
                    const begin = Offset(-1.0, 0.0); // from left
                    const end = Offset.zero;
                    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOut));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );

            }),
          ],
        ),
      ),
    );
  }
}
