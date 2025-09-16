import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';


class PrayerClickScreen extends StatelessWidget {
  const PrayerClickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 15,right: 15,bottom: 15),
        decoration: BoxDecoration(
           gradient:  LinearGradient(
              begin: Alignment(-0.40, 0.11),
              end: Alignment(0.04,0.34 ),
              colors: [const Color(0xffB1C2D0),
                const Color(0xF994D94E0)],
            )
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text(
              'myChristianity',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF664F42),
                fontSize: 36,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
                height: 0.61,
              ),
            ),
            Spacer(),
            Text(
              '“Love is patient, love is kind. It does not envy, it does not boast, it is not proud”',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 32,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.32,
              ),
            ),
            SizedBox(height: 24,),
            Text(
              '1 CORINGTHIANS 13:4',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 20,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.20,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 102),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'Share',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF292929),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      height: 1.50,
                      letterSpacing: -0.48,
                    ),
                  ),
                  SvgPicture.asset("assets/onboarding_screen/cross.svg")
                ],
              ),
            ),
            SizedBox(height: 24,),
            Text(
              'Or, tap anywhere to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.48,
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
