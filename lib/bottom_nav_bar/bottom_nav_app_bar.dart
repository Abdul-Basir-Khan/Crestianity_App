import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bibles_screen/bibles_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/chat_main.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/home_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/learn_main_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/quiz_screen/quiz_screen.dart';
import 'package:svg_flutter/svg.dart';

class BottomNavAppBar extends StatefulWidget {
  const BottomNavAppBar({super.key});

  @override
  State<BottomNavAppBar> createState() => _BottomNavAppBarState();
}

class _BottomNavAppBarState extends State<BottomNavAppBar> {
  final List<Widget> _bottomNavItem = [
    ChatMain(),
    QuizScreen(
      levels: [
        LevelData(number: 1),
        LevelData(number: 2, isLocked: true),
        LevelData(number: 3, hasReward: true),
        LevelData(number: 4),
        LevelData(number: 5, isLocked: true),
        LevelData(number: 6),
      ],
      currentLevel: 3, // Example current level
    ),
    HomeScreen(),
  BiblesScreen(),
   LearnMainScreen(),
  ];
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFAEB),
      body: _bottomNavItem[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        padding: EdgeInsets.zero,
        child: Container(
          height: 59,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 0,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomTab(
                onTap: () {
                  onTabTapped(0);
                },
                activeColor:
                    _currentIndex == 0 ? Color(0xff664F42) : Color(0xff5A5A5A),
                title: 'Chat',
                icon: _currentIndex == 0
                    ? SvgPicture.asset('assets/home_icons/chat_enable.svg')
                    : SvgPicture.asset('assets/home_icons/chat _disable.svg'),
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(1);
                },
                activeColor:
                    _currentIndex == 1 ? Color(0xff664F42) : Color(0xff5A5A5A),
                title: 'Quiz',
                icon: _currentIndex == 1
                    ? SvgPicture.asset('assets/home_icons/grid_enable.svg')
                    : SvgPicture.asset('assets/home_icons/grid_disable.svg'),
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(2);
                },
                activeColor:
                    _currentIndex == 2 ? Color(0xff664F42) : Color(0xff5A5A5A),
                title: 'Home',
                icon: _currentIndex == 2
                    ? SvgPicture.asset('assets/home_icons/home_enable.svg')
                    : SvgPicture.asset('assets/home_icons/home_disable.svg'),
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(3);
                },
                activeColor:
                    _currentIndex == 3 ? Color(0xff664F42) : Color(0xff5A5A5A),
                title: 'Bibles',
                icon: _currentIndex == 3
                    ? SvgPicture.asset('assets/home_icons/bible_enable.svg')
                    : SvgPicture.asset('assets/home_icons/bible_diable.svg'),
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(4);
                },
                activeColor:
                    _currentIndex == 4 ? Color(0xff664F42) : Color(0xff5A5A5A),
                title: 'Learn',
                icon: _currentIndex == 4
                    ? SvgPicture.asset('assets/home_icons/learn_enable.svg')
                    : SvgPicture.asset('assets/home_icons/learn_disable.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  final String title;
  final Color activeColor;
  final Widget icon;
  final VoidCallback onTap;

  const BottomTab({
    super.key,
    required this.title,
    required this.activeColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          icon,
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: activeColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
