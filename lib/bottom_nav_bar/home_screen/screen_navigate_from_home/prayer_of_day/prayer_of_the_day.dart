import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:svg_flutter/svg.dart';

class PrayerOfTheDay extends StatefulWidget {
  const PrayerOfTheDay({super.key});

  @override
  State<PrayerOfTheDay> createState() => _PrayerOfTheDayState();
}

class _PrayerOfTheDayState extends State<PrayerOfTheDay> {
  int isSpeakOrRead = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 15, right: 15),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/home_navigation/Daily Devotional.png"))),
        child: Stack(
          clipBehavior: Clip.none,

          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xf984a413b),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xf984a413b),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your progress',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '100%',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressBar(
                  maxSteps: 100,
                  progressType: LinearProgressBar.progressTypeLinear,
                  // Use Linear progress
                  currentStep: 100,
                  progressColor: Color(0xFF00A251),
                  backgroundColor: Color(0x51737373),
                  borderRadius: BorderRadius.circular(10), //  NEW
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Prayer of the Day',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Quincy CF',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.32,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
               'Heavenly Father, thank you for being my salvation and my constant source of strength. Help me trust you fully, casting away all fears and worries, embracing your peace. Let your love fill my heart, guiding my steps and renewing my spirit. As I place my faith in you today, remind me that I am never alone and that your grace will carry me through every challenge. Amen.',
                 style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            Positioned(
              bottom: 10,left: 0,right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      color: Color(0xffD8D8D8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSpeakOrRead = 0;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: ShapeDecoration(
                                color: isSpeakOrRead == 0
                                    ? Color(0xFF664F42)
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 4,
                                children: [
                                  SvgPicture.asset(
                                      color: isSpeakOrRead == 0
                                          ? Colors.white
                                          : Color(0xff664F42),
                                      "assets/home_navigation/speaker.svg"),
                                  isSpeakOrRead == 0
                                      ? Text(
                                    'Speak',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.48,
                                    ),
                                  )
                                      : SizedBox()
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSpeakOrRead = 1;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: ShapeDecoration(
                                color: isSpeakOrRead == 1
                                    ? Color(0xFF664F42)
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 4,
                                children: [
                                  SvgPicture.asset(
                                      color: isSpeakOrRead == 1
                                          ? Colors.white
                                          : Color(0xff664F42),
                                      "assets/home_navigation/book.svg"),
                                  isSpeakOrRead == 1
                                      ? Text(
                                    'Read',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.48,
                                    ),
                                  )
                                      : SizedBox()
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xf40000000),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
