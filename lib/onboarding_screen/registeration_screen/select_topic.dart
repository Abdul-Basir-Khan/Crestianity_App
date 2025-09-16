import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bottom_nav_app_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/journey_screen.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

// A custom widget that applies a tap (scale) animation.
class TapAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const TapAnimation({required this.child, required this.onTap, Key? key})
      : super(key: key);

  @override
  _TapAnimationState createState() => _TapAnimationState();
}

class _TapAnimationState extends State<TapAnimation> {
  double _scale = 1.0;

  Future<void> _animateTap() async {
    setState(() {
      _scale = 0.95;
    });
    // Wait a short duration for the effect.
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      _scale = 1.0;
    });
    // Call the provided onTap callback.
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animateTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }
}


class SelectTopicScreen extends StatefulWidget {
  const SelectTopicScreen({Key? key}) : super(key: key);

  @override
  _SelectTopicScreenState createState() => _SelectTopicScreenState();
}

class _SelectTopicScreenState extends State<SelectTopicScreen>
    with SingleTickerProviderStateMixin {
  // Track multiple selected indices.
  final Set<int> _selectedIndices = {};
  final List<String> selectTopicList = [
    'Faith development',
    "Mental clarity",
    'Scripture in 365 days',
    'Breaking negative cycles',
    'Something else',
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
    _slideAnimations = List.generate(selectTopicList.length, (index) {
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
            const Text(
              'Which topic would you like to\nexplore first',
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
              'This will not limit your myChristianity experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF292929),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: selectTopicList.length,
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
                          selectTopicList[index],
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
            ),
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
                // Navigation logic here.

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) => JourneyScreen(),
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
