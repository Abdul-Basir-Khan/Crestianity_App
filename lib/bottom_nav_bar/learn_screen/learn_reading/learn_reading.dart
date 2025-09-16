import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg.dart';

class LearnReading extends StatefulWidget {
  const LearnReading({super.key});

  @override
  State<LearnReading> createState() => _LearnReadingState();
}

class _LearnReadingState extends State<LearnReading> {
  int isSpeakOrRead = 0;
  final PageController _indicatorController = PageController();

  @override
  void dispose() {
    _indicatorController.dispose();
    super.dispose();
  }

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
                image: AssetImage("assets/learning_screen/5476958_2817288 1.png"))),
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
                        backgroundColor: Color(0xf08737373),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff101010),
                        ),
                      ),
                    ),
                    Text(
                      'James 5:16',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF292929),
                        fontSize: 20,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset("assets/learning_screen/share.svg")
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
                       color: const Color(0xFF292929),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '35%',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF292929),
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
                  currentStep: 35,
                  progressColor: Color(0xFF00A251),
                  backgroundColor: Color(0x51737373),
                  borderRadius: BorderRadius.circular(10), //  NEW
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Therefore confess your sins to each other and pray for each other so that you may be healed. The prayer of a righteous person is powerful and effective',
                  style: TextStyle(
                    color: const Color(0xFF292929),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            Positioned(
              bottom: 10,left: 0,right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0x28737373),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SmoothPageIndicator(
                      controller: _indicatorController,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 12,
                        activeDotColor: Color(0xFF292929),
                        dotColor:  Color(0x7F737373),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF664F42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          'Read full chapter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.42,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  isSpeakOrRead==0?Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      SvgPicture.asset("assets/learning_screen/previous 01.svg"),
                      SvgPicture.asset("assets/learning_screen/play.svg"),
                      SvgPicture.asset("assets/learning_screen/next.svg"),

                    ],
                  ):SizedBox(),
                  isSpeakOrRead==0?SizedBox(height: 16,):SizedBox(height: 0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xff6b7f7b),
                        child:SvgPicture.asset("assets/learning_screen/chat 02.svg")
                      ),
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
                                        'Listen',
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
                        backgroundColor: Color(0xff6b7f7b),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


