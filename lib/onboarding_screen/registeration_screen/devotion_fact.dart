import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bottom_nav_app_bar.dart';
import 'package:svg_flutter/svg.dart';

class DevotionFact extends StatefulWidget {
  const DevotionFact({super.key});

  @override
  State<DevotionFact> createState() => _DevotionFactState();
}

class _DevotionFactState extends State<DevotionFact>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _radiusAnimation;
  bool isHolding = false;
  Offset? tapPosition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // Slower spread
    );

    _radiusAnimation = Tween<double>(begin: 0, end: 2000).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (_, animation, secondaryAnimation) => BottomNavAppBar(),
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

      }
    });
  }

  void startHold(LongPressStartDetails details) {
    setState(() {
      isHolding = true;
      tapPosition = details.globalPosition;
    });
    _animationController.forward();
  }

  void cancelHold() {
    if (_animationController.isAnimating) {
      _animationController.reset();
      setState(() => isHolding = false);
    }
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Column(
              children: [
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
                const Text(
                  'Devotion pact',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF292929),
                    fontFamily: 'Quincy CF',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text:
                            'To nurture my spiritual growth, I pledge to remain dedicated. I commit to:\n\n',
                            style: TextStyle(
                              color: Color(0xFF292929),
                              fontSize: 20,
                              fontFamily: 'Quincy CF',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(
                            text:
                            'Setting aside moments for scripture each day, however brief.\nContemplating divine wisdom to discover strength, serenity, and contentment.\n',
                            style: TextStyle(
                              color: Color(0xFF292929),
                              fontSize: 20,
                              fontFamily: 'Quincy CF',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(
                            text:
                            '\nI, Jane, place my confidence in Haven to accompany me on this path and assist me in fulfilling my spiritual aspirations.\n\nPress and hold to confirm...',
                            style: TextStyle(
                              color: Color(0xFF292929),
                              fontSize: 20,
                              fontFamily: 'Quincy CF',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onLongPressStart: startHold,
                  onLongPressEnd: (_) => cancelHold(),
                  child:  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xffFBEBE0),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: SvgPicture.asset(
                        "assets/onboarding_screen/fingerprint.svg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          if (isHolding && tapPosition != null)
            AnimatedBuilder(
              animation: _radiusAnimation,
              builder: (context, child) {
                return ClipPath(
                  clipper: CircleClipper(tapPosition!, _radiusAnimation.value),
                  child: Container(color: const Color(0xFF664F42)),
                );
              },
            ),
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  final Offset center;
  final double radius;

  CircleClipper(this.center, this.radius);

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) =>
      oldClipper.radius != radius || oldClipper.center != center;
}


