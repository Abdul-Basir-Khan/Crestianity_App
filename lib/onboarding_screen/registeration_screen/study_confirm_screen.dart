import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bottom_nav_app_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/journey_screen.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/select_topic.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/time_selection.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/way_to_connect_with_god.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';




class StudyConfirmScreen extends StatefulWidget {
  const StudyConfirmScreen({Key? key}) : super(key: key);

  @override
  _StudyConfirmScreenState createState() => _StudyConfirmScreenState();
}

class _StudyConfirmScreenState extends State<StudyConfirmScreen>
    with SingleTickerProviderStateMixin {
  // Track multiple selected indices.
  int? _selectedIndex;
  final List<String> motivationList = [
    'Friends/Family',
    "Church",
    'Twitter (X)',
    'Tiktok',
    'Instagram',
    'Youtube',
    'Google/Apple app store',
  ];

  final List iconList=[
    'assets/home_icons/community.svg',
    'assets/home_icons/church.svg',
    'assets/home_icons/twitter.svg',
    'assets/home_icons/tiktok.svg',
    'assets/home_icons/instagram.svg',
    'assets/home_icons/youtube.svg',
    'assets/home_icons/google.svg'
  ];

  late AnimationController _animationController;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    // Increase the duration to 1200ms for a slower slide animation.
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Create staggered slide animations for each list item.
    _slideAnimations = List.generate(motivationList.length, (index) {
      final start = index * 0.1;
      final end = start + 0.5;
      return Tween<Offset>(
        begin: const Offset(-1, 0), // Starts offscreen to the left.
        end: const Offset(0, 0),    // Ends at its natural position.
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    // Start the slide animation.
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAEB),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            LinearProgressBar(
              maxSteps: 100,
              minHeight: 4,
              progressType: LinearProgressBar.progressTypeLinear,
              currentStep: 20,
              progressColor: const Color(0xFF664F42),
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 24),
            const Text(
              'Studies confirm that spiritual practice correlates with greater wellbeing and life contentment.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF292929),
                fontSize: 24,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height:24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.18, 0.35),
                  end: Alignment(0.85, 0.94),
                  colors: [const Color(0xFFFBEBE0), const Color(0xFFFFFAEF)],
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFF917C6F),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment:

                CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/home_icons/format-quote.svg"),
                  RichText(text: TextSpan(
                      text:
                      'As a beginner, Haven has been phenomenal with guiding me on verses specific to my life circumstances. All I can say is thank you',
                      style: TextStyle(
                        color: const Color(0xFF292929),
                        fontSize: 20,
                        fontFamily: 'Quincy CF',
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text:
                          '!',
                          style: TextStyle(
                            color: const Color(0xFF292929),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                          ),


                        )
                      ]

                  )),
                  SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:AssetImage("assets/home_screen/Frame 1410067425.png") ,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index)=> SvgPicture.asset(
                                height: 15,width: 15,
                                "assets/onboarding_screen/star.svg")),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'Johnathan F.',
                            style: TextStyle(
                              color: const Color(0xFF292929),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  )


                ],
              ),
            ),
            Spacer(),
            const SizedBox(height:24),
            CustomButton(
              onTap: () {
                // Navigation logic here.
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) => TimeSelection(),
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

              },
              bgColor: const Color(0xFF664F42),
            ),
          ],
        ),
      ),
    );
  }
}
