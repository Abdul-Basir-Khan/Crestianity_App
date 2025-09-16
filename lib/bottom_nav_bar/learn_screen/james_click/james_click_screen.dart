import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../learn_explaination/learn_explaination.dart';
import '../learn_main_screen.dart';

final List<LearnModel> learningWidgetData = [
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
  LearnModel(
      title: "5 days",
      image: "assets/learning_screen/Rectangle 1176 (1).png",
      subTitle: "How to study the bible (foundations)"),
];

class JamesClickScreen extends StatelessWidget {
  const JamesClickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFAEB),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFAEB),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: const Color(0x14737373),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xff292929),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'James',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF292929),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          SvgPicture.asset("assets/home_navigation/search 8.svg"),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          ...List.generate(
            learningWidgetData.length,
            (index) => _buildLearningWidget(
              learningWidgetData[index].image,
              learningWidgetData[index].title,
              learningWidgetData[index].subTitle,
              () {
                // onTap Start
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) =>
                        LearnExplaination(),
                    transitionsBuilder: (_, animation, __, child) {
                      const begin = Offset(-1.0, 0.0); // from left
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
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildLearningWidget(
      String image, String title, String subTitle, VoidCallback onTapStart) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF737373),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: const Color(0xFF101010),
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTapStart,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: ShapeDecoration(
                color: const Color(0xFFFBEBE0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFF664F42),
                  ),
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'Start',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF664F42),
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.42,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
