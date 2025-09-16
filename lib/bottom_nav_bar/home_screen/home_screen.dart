import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/bottom_sheet/stay_connected_bottom_sheet.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/screen_navigate_from_home/connection_with_god/connection_with_god.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/screen_navigate_from_home/dailly_devotion/daily_devotion.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/screen_navigate_from_home/daily_verse/daily_verse.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/screen_navigate_from_home/history_screen/history_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/screen_navigate_from_home/prayer_click_screen/prayer_click_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/screen_navigate_from_home/prayer_of_day/prayer_of_the_day.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/setting_screen.dart';
import 'package:my_cristianity_app/widget/action_buton.dart';
import 'package:share_plus/share_plus.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  // Example: 7 days starting from a given date.
  // You can generate this list dynamically for the current week, etc.
  final List<DateTime> weekDates;

  HomeScreen({Key? key})
      : weekDates = _generateWeekDates(DateTime.now()),
        super(key: key);

  static List<DateTime> _generateWeekDates(DateTime currentDate) {
    // Find the Monday of the current week.
    final int currentWeekday = currentDate.weekday; // Monday = 1, Sunday = 7.
    final DateTime monday =
        currentDate.subtract(Duration(days: currentWeekday - 1));

    // Generate the week from Monday to Sunday.
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContainerModel> containerData = [
    ContainerModel(
      imagePath: "assets/home_screen/3.png",
      time: "2 min",
      title: "Daily Verse",
    ),
    ContainerModel(
      imagePath: "assets/home_screen/4.png",
      time: "2 min",
      title: "Daily Devotional",
    ),
    ContainerModel(
      imagePath: "assets/home_screen/5.png",
      time: "2 min",
      title: "Daily Prayer",
    ),
  ];

  double _discoveryFlashOpacity = 0;

  void _triggerDiscoveryFlash() {
    setState(() => _discoveryFlashOpacity = 1);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() => _discoveryFlashOpacity = 0);
    });
  }

  bool isConnection = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/home_screen/Frame 1410067425.png"),
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                const Duration(milliseconds: 300),
                                pageBuilder:
                                    (_, animation, secondaryAnimation) =>
                                   HistoryScreen(),
                                transitionsBuilder:
                                    (_, animation, __, child) {
                                  const begin =
                                  Offset(-1.0, 0.0); // from left
                                  const end = Offset.zero;
                                  final tween = Tween(begin: begin, end: end)
                                      .chain(
                                      CurveTween(curve: Curves.easeOut));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFEF8F5),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: const Color(0x14F3BD9C),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.watch_later,
                              color: Color(0xff664F42),
                            )),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF664F42),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(120),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Text(
                                'PRO',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.42,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                const Duration(milliseconds: 300),
                                pageBuilder:
                                    (_, animation, secondaryAnimation) =>
                                    SettingScreen(),
                                transitionsBuilder:
                                    (_, animation, __, child) {
                                  const begin =
                                  Offset(-1.0, 0.0); // from left
                                  const end = Offset.zero;
                                  final tween = Tween(begin: begin, end: end)
                                      .chain(
                                      CurveTween(curve: Curves.easeOut));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFEF8F5),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    color: const Color(0x14F3BD9C),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child:
                                  SvgPicture.asset("assets/home_screen/user.svg")),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              left: 15,
              right: 15,
              child: Container(
                padding: const EdgeInsets.only(bottom: 12),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x14F3BD9C),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF866856),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'God bless you, Christian',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  pageBuilder:
                                      (_, animation, secondaryAnimation) =>
                                          PrayerClickScreen(),
                                  transitionsBuilder:
                                      (_, animation, __, child) {
                                    const begin =
                                        Offset(-1.0, 0.0); // from left
                                    const end = Offset.zero;
                                    final tween = Tween(begin: begin, end: end)
                                        .chain(
                                            CurveTween(curve: Curves.easeOut));
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 4,
                                children: [
                                  Text(
                                    'Morning prayer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.42,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            // You can use Wrap or a Row with spacing as well
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.weekDates.map((date) {
                              return Expanded(
                                child: _DayItem(
                                  date: date,
                                  isSelected: _isToday(date),
                                  // Decide how you want to highlight the current day or any special day
                                  // or pass in other conditions, e.g. "isHoliday" etc.
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your progress',
                    style: TextStyle(
                      color: const Color(0xFF737373),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '67%',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF101010),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LinearProgressBar(
                maxSteps: 100,
                progressType: LinearProgressBar.progressTypeLinear,
                // Use Linear progress
                currentStep: 80,
                progressColor: Color(0xFF00A251),
                backgroundColor: Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(10), //  NEW
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/home_screen/1.png"))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Daily  Quote',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Quincy CF',
                        fontWeight: FontWeight.w800,
                        height: 1.20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Philippians 5:13',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Quincy CF',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'I can do all things through Christ who strengthens me. No matter what challenges I face, He empowers me. With Him, all things are possible ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Quincy CF',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  // 👈 handles keyboard correctly
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.85,
                                        child:
                                            StayConnectedBottomSheet()), // 👈 your custom content
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF664F42),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(120),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/home_screen/notification.svg"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Notify me',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
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
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // text or URL you want to share
                            final content =
                                'Hey! Check out this cool app: https://yourapp.link';
                            Share.share(
                              content,
                              subject: 'Share with friends',
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFF9E1D1),
                            child:
                                SvgPicture.asset("assets/home_screen/share.svg"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 190,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/home_screen/2.png"))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade50)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 4, left: 4, right: 8, bottom: 4),
                          decoration: ShapeDecoration(
                            color: const Color(0x51737373),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/home_screen/clock circle.svg"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '2 mins',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isConnection = !isConnection;
                            });
                          },
                          child: isConnection == true
                              ? Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                ),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Daily Connection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Quincy CF',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'How is your relationship with God today?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: isConnection,
                      child: GestureDetector(
                        onTap: () {
                          _triggerDiscoveryFlash();
                          Future.delayed(const Duration(milliseconds: 150), () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 300),
                                pageBuilder: (_, animation, secondaryAnimation) => ConnectionWithGod(),
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
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: ShapeDecoration(
                                color: const Color(0xf94737373),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Discovery Now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.42,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_forward, color: Colors.white),
                                ],
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: _discoveryFlashOpacity,
                              duration: const Duration(milliseconds: 100),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 17),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ...List.generate(
                  containerData.length,
                  (index) => ExpandableContainer(
                      imagePath: containerData[index].imagePath,
                      time: containerData[index].time,
                      title: containerData[index].title,
                      onListen: () {
                        index == 0
                            ? Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  pageBuilder:
                                      (_, animation, secondaryAnimation) =>
                                          DailyVerse(),
                                  transitionsBuilder:
                                      (_, animation, __, child) {
                                    const begin =
                                        Offset(-1.0, 0.0); // from left
                                    const end = Offset.zero;
                                    final tween = Tween(begin: begin, end: end)
                                        .chain(
                                            CurveTween(curve: Curves.easeOut));
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              )
                            : index == 1
                                ? Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      pageBuilder:
                                          (_, animation, secondaryAnimation) =>
                                              DailyDevotion(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        const begin =
                                            Offset(-1.0, 0.0); // from left
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end).chain(
                                                CurveTween(
                                                    curve: Curves.easeOut));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  )
                                : Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      pageBuilder:
                                          (_, animation, secondaryAnimation) =>
                                              PrayerOfTheDay(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        const begin =
                                            Offset(-1.0, 0.0); // from left
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end).chain(
                                                CurveTween(
                                                    curve: Curves.easeOut));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                      },
                      onRead: () {
                        index == 0
                            ? Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  pageBuilder:
                                      (_, animation, secondaryAnimation) =>
                                          DailyVerse(),
                                  transitionsBuilder:
                                      (_, animation, __, child) {
                                    const begin =
                                        Offset(-1.0, 0.0); // from left
                                    const end = Offset.zero;
                                    final tween = Tween(begin: begin, end: end)
                                        .chain(
                                            CurveTween(curve: Curves.easeOut));
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              )
                            : index == 1
                                ? Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      pageBuilder:
                                          (_, animation, secondaryAnimation) =>
                                              DailyDevotion(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        const begin =
                                            Offset(-1.0, 0.0); // from left
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end).chain(
                                                CurveTween(
                                                    curve: Curves.easeOut));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  )
                                : Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      pageBuilder:
                                          (_, animation, secondaryAnimation) =>
                                              PrayerOfTheDay(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        const begin =
                                            Offset(-1.0, 0.0); // from left
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end).chain(
                                                CurveTween(
                                                    curve: Curves.easeOut));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                      })),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 260,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/home_screen/jusus.png"))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '788.373.990',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF292929),
                          fontSize: 48,
                          fontFamily: 'Quincy CF',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.48,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Prayers prayed with myChristianity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF292929),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          // text or URL you want to share
                          final content =
                              'Hey! Check out this cool app: https://yourapp.link';
                          Share.share(
                            content,
                            subject: 'Share with friends',
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF664F42),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(120),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Share with friends',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.48,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day);
  }
}

class _DayItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const _DayItem({
    Key? key,
    required this.date,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format day of week (Mo, Tu, We...) and day of month (24, 25, 26...)
    final dayOfWeek = DateFormat('EEE').format(date); // e.g. Mon, Tue, Wed
    final dayNumber = date.day.toString();

    // Example highlight color if selected
    final backgroundColor = isSelected ? Color(0xFFededed) : Color(0xFFEDEDED);
    final borderColor = isSelected ? Color(0xFFAD866F) : Color(0xFFEDEDED);
    final textColor = isSelected ? Color(0xFF664F42) : Color(0xFF737373);

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // Show only first 2 letters if you want: dayOfWeek.substring(0, 2)
            dayOfWeek,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF292929),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              height: 1.20,
            ),
          ),
          const SizedBox(height: 8),
          // Circle for the date
          dayOfWeek == "Thu" || dayOfWeek == "Fri"
              ? Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFBEBE0),
                  ),
                  child: Center(
                      child: SvgPicture.asset("assets/quiz/hand.svg")),
                )
              : Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                      border: Border.all(color: borderColor, width: 2)),
                  child: Center(
                    child: Text(
                      dayNumber,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class ContainerModel {
  final String imagePath;
  final String time;
  final String title;

  ContainerModel({
    required this.imagePath,
    required this.time,
    required this.title,
  });
}

class ExpandableContainer extends StatefulWidget {
  final String imagePath;
  final String time;
  final String title;
  final VoidCallback onListen;
  final VoidCallback onRead;

  const ExpandableContainer({
    Key? key,
    required this.imagePath,
    required this.time,
    required this.title,
    required this.onListen,
    required this.onRead,
  }) : super(key: key);

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:_isExpanded? 170:140,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.imagePath),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row: dot, time chip, expand icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade50),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: ShapeDecoration(
                  color: const Color(0x51737373),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/home_screen/clock circle.svg"),
                    const SizedBox(width: 6),
                    Text(
                      widget.time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const Spacer(),

          // title
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Quincy CF',
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 5),

          // buttons row
          Visibility(
            visible: _isExpanded,
            child: Row(
              children: [
                Expanded(
                  child:ActionButton(
                    iconPath: "assets/home_navigation/speaker.svg",
                    label: "Listen",
                    onTap: widget.onListen,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ActionButton(
                    iconPath: "assets/home_navigation/book.svg",
                    label: "Read",
                    onTap: widget.onRead,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
