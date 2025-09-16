import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bottom_nav_app_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/what_motivate_u.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({Key? key}) : super(key: key);

  @override
  _JourneyScreenState createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
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
                  text: 'You have begun a meaningful journey',
                  style: TextStyle(
                    color: const Color(0xFF292929),
                    fontSize: 24,
                    fontFamily: 'Quincy CF',
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '!',
                      style: TextStyle(
                        color: const Color(0xFF292929),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
            ),

            const SizedBox(height: 4),
            Text(
              '86% of users who begin with one growth area report finding greater purpose and direction within their first month.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            const SizedBox(height: 24),

            /// ✳️ Bar Chart Widget
            const BarChartWidget(),
            Spacer(),

            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) =>WhatMotivateYouScreen(),
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

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final barData = [
    {'label': 'Spiritual\ngrowth', 'value': 50.0, 'color': Color(0xFFFED4C2)},
    {'label': 'Purpose', 'value': 200.0, 'color': Color(0xFFFBEBE0)},
    {'label': 'Decision\nmaking', 'value': 120.0, 'color': Color(0xFFFFE9B5)},
    {'label': 'Family', 'value': 160.0, 'color': Color(0xFFD0D1FF)},
  ];

  List<double> animatedHeights = [];

  @override
  void initState() {
    super.initState();
    animatedHeights = List.filled(barData.length, 0.0);

    // Sequential animation: each starts after previous finishes
    Future.delayed(const Duration(milliseconds: 300), () {
      _animateBar(0);
    });
  }

  void _animateBar(int index) {
    if (index >= barData.length) return;

    setState(() {
      animatedHeights[index] = barData[index]['value'] as double;
    });

    // Wait for animation to finish before starting next
    Future.delayed(const Duration(milliseconds: 600), () {
      _animateBar(index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: barData.asMap().entries.map((entry) {
        final index = entry.key;
        final bar = entry.value;

        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                bar['label'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF292929),
                  fontSize: 16,
                  fontFamily: 'Quincy CF',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                height: animatedHeights[index],
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: bar['color'] as Color,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}


