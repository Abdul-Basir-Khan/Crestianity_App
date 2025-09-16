import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/devotion_fact.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/time_selection.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';

class AchieveGoalScreen extends StatelessWidget {
  const AchieveGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAEB),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 20,
          right: 20,
          bottom: 15,
        ),
        child: Column(
          children: [
            /// Progress bar
            LinearProgressBar(
              maxSteps: 100,
              minHeight: 4,
              currentStep: 20,
              progressType: LinearProgressBar.progressTypeLinear,
              progressColor: const Color(0xFF664F42),
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 24),

            /// Header text
            const Text(
              'Get ready to achieve all your goals\nwith myChristianity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF292929),
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 30),


         Align(
           alignment: Alignment.topRight,
           child:
           Container(
             width: MediaQuery.sizeOf(context).width*0.65,
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
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
               children: const [
                 Text(
                   'With myChristianity',
                   style: TextStyle(
                     color: const Color(0xFF292929),
                     fontSize: 20,
                     fontFamily: 'Quincy CF',
                     fontWeight: FontWeight.w700,
                   ),
                 ),
                 SizedBox(height: 16),
                 GoalRow(iconColor: Color(0xff101010),icon: Icons.check, text: 'Faith guidance on your schedule'),
                 GoalRow(iconColor: Color(0xff101010),icon: Icons.check, text: 'Verses meant for you'),
                 GoalRow(iconColor: Color(0xff101010),icon: Icons.check, text: 'Clear path for growth'),
                 GoalRow(iconColor: Color(0xff101010),icon: Icons.check, text: 'Biblical wisdom for daily life'),
               ],
             ),
           ),


         ),
            /// "With" container - aligned top right
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.bottomLeft,
              child:   Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: const EdgeInsets.all(24),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFF917C6F),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'No\nmyChristianity',
                      style: TextStyle(
                        color: const Color(0xFF292929),
                        fontSize: 20,
                        fontFamily: 'Quincy CF',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    GoalRow(
                      icon: Icons.close,
                      text: 'Too busy for studying bible',
                      iconColor: Color(0xff101010),
                    ),
                    GoalRow(
                      icon: Icons.close,
                      text: 'Feeling distant from God',
                      iconColor:Color(0xff101010),
                    ),
                    GoalRow(
                      icon: Icons.close,
                      text: 'No guidance in spiritual growth',
                      iconColor: Color(0xff101010),
                    ),
                    GoalRow(
                      icon: Icons.close,
                      text: 'Unsure how to apply scripture',
                      iconColor: Color(0xff101010),
                    ),
                  ],
                ),
              ),


            ),
            const SizedBox(height: 24),
Spacer(),
            /// Continue button
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) => DevotionFact(),
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

/// Reusable bullet row widget
class GoalRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const GoalRow({
    Key? key,
    required this.icon,
    required this.text,
    this.iconColor = const Color(0xFF664F42),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
