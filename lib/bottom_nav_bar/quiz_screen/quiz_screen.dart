import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/quiz_screen/quiz_question_screen/quiz_question_screen.dart';
import 'package:svg_flutter/svg.dart';

class QuizScreen extends StatelessWidget {
  final List<LevelData> levels;
  final int currentLevel;

  const QuizScreen({
    Key? key,
    required this.levels,
    this.currentLevel = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAEB),
      body: Stack(
        children: [
          // background image
          Positioned.fill(
            child: Image.asset(
              'assets/quiz/OBJECTS.png',
              fit: BoxFit.cover,
            ),
          ),

          // levels + path
          LayoutBuilder(builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;
            final points = _calculateLevelPositions(w, h, levels.length);

            return Stack(
              children: [
                // connecting path
                CustomPaint(
                  size: Size(w, h),
                  painter: _LevelPathPainter(
                    points,
                  ),
                ),

                // nodes
                for (var i = 0; i < levels.length; i++)
                  _buildLevelNode(context, i, levels[i], points[i]),
              ],
            );
          }),
        ],
      ),
    );
  }

  List<Offset> _calculateLevelPositions(
      double width, double height, int count) {
    final padding = 80.0;
    final usable = height - padding * 2;
    final step = usable / (count - 1);
    final leftX = width * 0.2;
    final rightX = width * 0.8;

    return List.generate(count, (i) {
      final dx = i.isEven ? leftX : rightX;
      final dy = padding + step * i;
      return Offset(dx, dy);
    });
  }

  Widget _buildLevelNode(
      BuildContext context, int index, LevelData level, Offset pos) {
    final isLocked = level.isLocked;
    final bgColor = isLocked ? Colors.brown.shade400 : Colors.brown.shade600;

    return Positioned(
      left: pos.dx - 30,
      top: pos.dy - 30,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) => const QuizQuestionScreen(
                questions: sampleQuestions,
                level: 2,
              ),
              transitionsBuilder: (_, anim, __, child) {
                // Animation for coming from the bottom
                const begin = Offset(0, 1); // Start from the bottom
                const end = Offset.zero; // End at the normal position
                return SlideTransition(
                  position: anim.drive(
                    Tween(begin: begin, end: end).chain(
                      CurveTween(curve: Curves.easeOut),
                    ),
                  ),
                  child: child,
                );
              },
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // circle
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: level.isSpecial
                  ? Icon(Icons.star, color: Colors.white, size: 24)
                  : Text(
                      '${level.number}/10',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),

            // gift icon
            if (level.hasReward)
              Positioned(
                top: -6,
                right: -6,
                child: SvgPicture.asset(
                  'assets/quiz/gift.svg',
                  width: 20,
                  height: 20,
                ),
              ),

            // lock overlay
            if (isLocked)
              Positioned.fill(
                child:
                Center(
                  child: LockBlurCircle(
                    size: 60.0,
                    blurSigma: 3.0,
                    overlayColor: Colors.black38,
                    assetName: 'assets/quiz/lock.svg',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _LevelPathPainter extends CustomPainter {
  final List<Offset> points;

  _LevelPathPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final paint = Paint()
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.brown.shade200, Colors.brown.shade600],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var p in points.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _LevelPathPainter old) => old.points != points;
}

class LevelData {
  final int number;
  final bool isLocked;
  final bool hasReward;
  final bool isSpecial;
  final VoidCallback? onTap;

  LevelData({
    required this.number,
    this.isLocked = false,
    this.hasReward = false,
    this.isSpecial = false,
    this.onTap,
  });
}



class LockBlurCircle extends StatelessWidget {
  /// Diameter of the circle.
  final double size;

  /// How strong the blur is.
  final double blurSigma;

  /// Semi-transparent overlay color behind blur.
  final Color overlayColor;

  /// Path to your lock SVG asset.
  final String assetName;

  const LockBlurCircle({
    Key? key,
    this.size = 48.0,
    this.blurSigma = 2.5,
    this.overlayColor = const Color(0x11000000),
    this.assetName = 'assets/quiz/lock.svg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 1) Blurred, circular backdrop
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurSigma,
              sigmaY: blurSigma,
            ),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: overlayColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),

        // 2) Lock icon on top (unblurred)
        SvgPicture.asset(
          assetName,
          width: size * 0.5,
          height: size * 0.5,
          color: Colors.white,
        ),
      ],
    );
  }
}
