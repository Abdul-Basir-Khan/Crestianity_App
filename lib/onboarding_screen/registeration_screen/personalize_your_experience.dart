// same imports...

import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/achieve_goal_screen.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';


class PersonalizeYourExperience extends StatefulWidget {
  const PersonalizeYourExperience({super.key});

  @override
  _PersonalizeYourExperienceState createState() => _PersonalizeYourExperienceState();
}

class _PersonalizeYourExperienceState extends State<PersonalizeYourExperience> {
  int yesPressCount = 0;

  List<Map<String, dynamic>> progressBars = [
    {'title': 'Setting goals', 'percent': 67},
  ];

  // Store old percentages for animation
  List<int> oldPercents = [0];

  void handleYesPressed() {
    setState(() {
      yesPressCount++;

      if (yesPressCount == 1) {
        oldPercents = progressBars.map((e) => e['percent'] as int).toList();
        progressBars[0]['percent'] = 100;
        progressBars.add({'title': 'Adapting growth areas', 'percent': 67});
        oldPercents.add(0);
      } else if (yesPressCount == 2) {
        oldPercents = progressBars.map((e) => e['percent'] as int).toList();
        progressBars[1]['percent'] = 100;
        progressBars.add({'title': 'Picking content', 'percent': 67});
        oldPercents.add(0);
      } else if (yesPressCount >= 3) {
        oldPercents = progressBars.map((e) => e['percent'] as int).toList();
        for (var i = 0; i < progressBars.length; i++) {
          progressBars[i]['percent'] = 100;
        }

        // Auto-navigate after short delay
        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, animation, __) => const AchieveGoalScreen(),
              transitionsBuilder: (_, animation, __, child) {
                const begin = Offset(-1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: Curves.easeOut));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        });
      }
    });
  }

  String getQuestionText() {
    switch (yesPressCount) {
      case 0:
        return 'When facing difficulties, do you sometimes wander from your intended path?';
      case 1:
        return 'Is it sometimes difficult to locate relevant scripture passages';
      case 2:
        return 'Do you typically complete projects you begin?';
      default:
        return '';
    }
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
            const Text(
              'We are personalizing your experience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF292929),
                fontSize: 24,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),

            /// Progress Bars
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(progressBars.length, (i) {
                final bar = progressBars[i];
                final oldValue = i < oldPercents.length ? oldPercents[i] : 0;
                final isComplete = bar['percent'] == 100;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bar['title'],
                            style: const TextStyle(
                              color: Color(0xFF737373),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          isComplete
                              ? const CircleAvatar(
                            radius: 9,
                            backgroundColor: Color(0xFF664F42),
                            child: Icon(Icons.done,
                                size: 10, color: Colors.white),
                          )
                              : Text(
                            '${bar['percent']}%',
                            style: const TextStyle(
                              color: Color(0xFF101010),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween<double>(
                          begin: oldValue.toDouble(),
                          end: (bar['percent'] as int).toDouble(),
                        ),
                        builder: (context, value, _) {
                          return LinearProgressBar(
                            maxSteps: 100,
                            currentStep: value.toInt(),
                            progressType:
                            LinearProgressBar.progressTypeLinear,
                            progressColor: const Color(0xFF664F42),
                            backgroundColor: const Color(0xFFEDEDED),
                            borderRadius: BorderRadius.circular(10),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),

            /// Animated Question Box
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: yesPressCount < 3
                  ? _buildQuestionCard()
                  : const SizedBox.shrink(),
            ),

            const Spacer(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Container(
      key: ValueKey("q$yesPressCount"),
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.18, 0.35),
          end: Alignment(0.85, 0.94),
          colors: [Color(0xFFFBEBE0), Color(0xFFFFFAEF)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF917C6F)),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'To move forward, specify',
            style: TextStyle(
              color: Color(0xFF737373),
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.5),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
            child: Text(
              getQuestionText(),
              key: ValueKey(getQuestionText()),
              style: const TextStyle(
                color: Color(0xFF292929),
                fontSize: 20,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFBEBE0),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF664F42),
                      ),
                      borderRadius: BorderRadius.circular(120),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Color(0xFF664F42),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: handleYesPressed,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF664F42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
