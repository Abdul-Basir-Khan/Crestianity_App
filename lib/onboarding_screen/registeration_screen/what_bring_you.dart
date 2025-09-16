import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/select_topic.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class WhatBringYouScreen extends StatefulWidget {
  const WhatBringYouScreen({super.key});

  @override
  _WhatBringYouScreenState createState() => _WhatBringYouScreenState();
}

class _WhatBringYouScreenState extends State<WhatBringYouScreen>
    with SingleTickerProviderStateMixin {
  // Use a set to track multiple selected indices.
  final Set<int> _selectedIndices = {};
  final List<String> whatBringList = [
    'Connect more deeply with God',
    "Deepen my spiritual journey",
    'Gain biblical wisdom',
    'Discover inner tranquility',
    'Discover inner tranquility',
    'Discover inner tranquility',
  ];
  late AnimationController _animationController;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    // Create an AnimationController with a slower 1200ms duration.
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Generate staggered slide animations for each list item.
    _slideAnimations = List.generate(whatBringList.length, (index) {
      final start = index * 0.1;
      final end = start + 0.5;
      // Clamp the end value to 1.0 so it does not exceed the valid range.
      final clampedEnd = end > 1.0 ? 1.0 : end;
      return Tween<Offset>(
        begin: const Offset(-1, 0), // Starts offscreen to the left.
        end: const Offset(0, 0),    // Ends at its natural position.
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, clampedEnd, curve: Curves.easeOut),
        ),
      );
    });

    // Start the slide-in animation.
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
          mainAxisAlignment: MainAxisAlignment.start,
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
              'What brings you to\nmyChristianity',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF292929),
                fontSize: 24,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Select all that apply',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF292929),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            // Generate the list items.
            // Build list items with both slide and tap animations.
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:   whatBringList.length,
              itemBuilder: (context, index) {
                return SlideTransition(
                  position: _slideAnimations[index],
                  child: TapAnimation(
                    onTap: () {
                      setState(() {
                        if (_selectedIndices.contains(index)) {
                          _selectedIndices.remove(index);
                        } else {
                          _selectedIndices.add(index);
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
                            color: _selectedIndices.contains(index)
                                ? const Color(0xFF664F42)
                                : const Color(0xFFFBEBE0),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        whatBringList[index],
                        style: const TextStyle(
                          color: Color(0xFF292929),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const Spacer(),
            CustomButton(
              onTap: () {
                if (_selectedIndices.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select at least one option"),
                    ),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) => SelectTopicScreen(),
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
              bgColor: _selectedIndices.isEmpty
                  ? const Color(0xFFDDAC8E)
                  : const Color(0xFF664F42),
            ),
          ],
        ),
      ),
    );
  }
}
