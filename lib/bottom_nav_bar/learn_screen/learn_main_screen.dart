import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/james_click/james_click_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/learn_details.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/my_plans/my_plans.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/saved_tab/saved_tab.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/search_screen/search_screen.dart';
import 'package:svg_flutter/svg.dart';


class LearnMainScreen extends StatefulWidget {
  const LearnMainScreen({super.key});
  @override
  State<LearnMainScreen> createState() => _LearnMainScreenState();
}

class _LearnMainScreenState extends State<LearnMainScreen> {
  bool _showHeader = true;                // ← NEW
  int _currentIndex = 0;

  final List tabsList = ['Find plans', 'My plans', 'Saved', 'Completed'];
  final List tabs = ['New','Relationships','Listen & Watch'];
  final List<StatusModel> statusData = [
    StatusModel(title: '🥰  LOVE', color: const Color(0xFF992C55)),
    StatusModel(title: '😌  HEALING', color: const Color(0xFFCA3E35)),
    StatusModel(title: '😇  Hope', color: const Color(0xFF483550)),
    StatusModel(title: '😞  ANXIETY', color: const Color(0xFF3D79C2)),
    StatusModel(title: '😠  ANGER', color: const Color(0xFF007B89)),
    StatusModel(title: '☹️  DEPRESSION', color: const Color(0xFF29537A)),
  ];
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
  ];

  final List<ParentModel> parentData = [
    ParentModel(
        title: "How to study the bi...",
        image: "assets/learning_screen/parent.png"),
    ParentModel(
        title: "How to study the bi...",
        image: "assets/learning_screen/parent.png"),
    ParentModel(
        title: "How to study the bi...",
        image: "assets/learning_screen/parent.png"),
    ParentModel(
        title: "How to study the bi...",
        image: "assets/learning_screen/parent.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFAEB),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==== HEADER ====
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _showHeader ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Learning plans',
                            style: TextStyle(
                              color: Color(0xFF101010),
                              fontSize: 24,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 300),
                                  pageBuilder: (_, __, ___) => const SearchScreen(),
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


                            child: SvgPicture.asset("assets/home_navigation/search 8.svg")),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // ==== TABS (unchanged) ====
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: List.generate(
                    tabsList.length,
                        (index) {
                      final sel = _currentIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => _currentIndex = index),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.fromLTRB(8, 5, 8, 6),
                          decoration: BoxDecoration(
                            color: sel ? const Color(0xFF664F42) : Colors.transparent,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: sel ? Colors.transparent : const Color(0xFFA8A8A8),
                            ),
                          ),
                          child: Text(
                            tabsList[index],
                            style: TextStyle(
                              color: sel ? const Color(0xFFF7D3BD) : const Color(0xFFA8A8A8),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ==== CONTENT ====
            if (_currentIndex == 0)
            // → FIND PLANS
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scroll) {
                    if (scroll is ScrollUpdateNotification) {
                      if (scroll.metrics.axis == Axis.vertical) {
                        if (scroll.scrollDelta! > 0 && _showHeader) {
                          setState(() => _showHeader = false);
                        } else if (scroll.scrollDelta! < 0 && !_showHeader) {
                          setState(() => _showHeader = true);
                        }
                      }
                    }
                    return false;
                  },
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      Image.asset("assets/learning_screen/Rectangle 1176.png"),
                      const SizedBox(height: 8),
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur. Aliquam vulputate ultrices',
                        style: TextStyle(
                          color: Color(0xFF101010),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: statusData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3.1,
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (ctx, i) {
                          final s = statusData[i];
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                            decoration: ShapeDecoration(
                              color: s.color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              s.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 300),
                              pageBuilder: (_,__,___) => const JamesClickScreen(),
                              transitionsBuilder: (_, anim, __, child) {
                                const begin = Offset(-1, 0), end = Offset.zero;
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
                        child: Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'James',
                                style: TextStyle(
                                  color: Color(0xFF101010),
                                  fontSize: 20,
                                  fontFamily: 'Quincy CF',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              'View all',
                              style: TextStyle(
                                color: Color(0xFF664F42),
                                fontSize: 16,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.48,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward, color: Color(0xFF664F42)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...learningWidgetData.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Image.asset(item.image),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        color: Color(0xFF737373),
                                        fontSize: 12,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      item.subTitle,
                                      style: const TextStyle(
                                        color: Color(0xFF101010),
                                        fontSize: 14,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: const Duration(milliseconds: 300),
                                      pageBuilder: (_,__,___) => const LearnDetails(),
                                      transitionsBuilder: (_, anim, __, child) {
                                        const begin = Offset(-1, 0), end = Offset.zero;
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
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFBEBE0),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Color(0xFF664F42), width: 1),
                                      borderRadius: BorderRadius.circular(120),
                                    ),
                                  ),
                                  child: const Text(
                                    'Start',
                                    style: TextStyle(
                                      color: Color(0xFF664F42),
                                      fontSize: 14,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.42,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Encouragement',
                              style: TextStyle(
                                color: const Color(0xFF101010),
                                fontSize: 20,
                                fontFamily: 'Quincy CF',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            'View all',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF664F42),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.48,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF664F42),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ...List.generate(
                        learningWidgetData.length,
                            (index) => _buildLearningWidget(
                          learningWidgetData[index].image,
                          learningWidgetData[index].title,
                          learningWidgetData[index].subTitle,
                              () {
                            //onTap Start
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Parents',
                              style: TextStyle(
                                color: const Color(0xFF101010),
                                fontSize: 20,
                                fontFamily: 'Quincy CF',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            'View all',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF664F42),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.48,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF664F42),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            parentData.length,
                                (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(parentData[index].image),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    parentData[index].title,
                                    style: TextStyle(
                                      color: const Color(0xFF292929),
                                      fontSize: 14,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'New to Faith',
                              style: TextStyle(
                                color: const Color(0xFF101010),
                                fontSize: 20,
                                fontFamily: 'Quincy CF',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            'View all',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF664F42),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.48,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF664F42),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ...List.generate(
                        learningWidgetData.length,
                            (index) => _buildLearningWidget(
                          learningWidgetData[index].image,
                          learningWidgetData[index].title,
                          learningWidgetData[index].subTitle,
                              () {
                            //onTap Start
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            else if (_currentIndex == 1)
            // → MY PLANS
              const Expanded(child: MyPlans())
            else if (_currentIndex == 2)
              // → SAVED
                const Expanded(child: SavedTab())
              else
              // → COMPLETED (stub)
                const Expanded(child: SizedBox()),
          ],
        ),
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


class StatusModel {
  final String title;
  final Color color;

  StatusModel({required this.title, required this.color});
}

class ParentModel {
  final String title;
  final String image;

  ParentModel({required this.title, required this.image});
}

class LearnModel {
  final String image;
  final String title;
  final String subTitle;

  LearnModel(
      {required this.title, required this.image, required this.subTitle});
}
