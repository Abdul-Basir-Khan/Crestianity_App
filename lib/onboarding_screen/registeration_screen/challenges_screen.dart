import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/journey_screen.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/select_topic.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/study_confirm_screen.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';



class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  _ChallengesScreenState createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen>
    with SingleTickerProviderStateMixin {
  // Track multiple selected _selectedIndices;
  int? _selectedIndex;
  final List<String> challengesList = [
    'Turn to my beliefs',
    "Seek spiritual guidance",
    'Consult trusted people',
    'Reflect privately',
    'Another method',
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
    _slideAnimations = List.generate(challengesList.length, (index) {
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
        child: Column(
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
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(

                    text:

                    'How do you usually deal with challenges?',
                    style: TextStyle(
                      color: Color(0xFF292929),
                      fontSize: 24,
                      fontFamily: 'Quincy CF',
                      fontWeight: FontWeight.w700,
                    ),
                )),

            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: challengesList.length,
              itemBuilder: (context, index) {
                return SlideTransition(
                  position: _slideAnimations[index],
                  child: TapAnimation(
                    onTap: () {
                      setState(() {
                        if (  _selectedIndex == index) {
                          _selectedIndex = null; // Unselect if already selected
                        } else {
                          _selectedIndex = index; // Select new one
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: ShapeDecoration(
                        color: const Color(0xf80FFFFFF),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color:_selectedIndex==index
                                ? const Color(0xFF664F42)
                                : const Color(0xFFFBEBE0),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              challengesList[index],
                              style: const TextStyle(
                                color: Color(0xFF292929),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                if (_selectedIndex==null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select at least one option"),
                    ),
                  );
                  return;
                }
                // Navigation logic here.

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) => StudyConfirmScreen(),
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
              bgColor:_selectedIndex==null
                  ? const Color(0xFFDDAC8E)
                  : const Color(0xFF664F42),
            ),
          ],
        ),
      ),
    );
  }
}
