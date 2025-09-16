import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/branch_screen/branch_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/chat_main.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/copy_code/copy_code.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/gender_selection/gender_selection.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/lock_screen_ui/lock_screen_ui.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/notification_screen/notification_screen.dart';
import 'package:svg_flutter/svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switchStates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFAEB),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFAEB),
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xff101010),
            )),
        title: Text(
          'Settings',
          style: TextStyle(
            color: const Color(0xFF101010),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: List.generate(
                settingData.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        index == 1?
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
                                padding: MediaQuery.of(context)
                                    .viewInsets, // 👈 handles keyboard correctly
                                child: SingleChildScrollView(
                                  child: SizedBox( height: MediaQuery.sizeOf(context).height * 0.90,
                                      child:LockScreenBottomSheet()), // 👈 your custom content
                                ),
                              );
                            })
        :
                        index == 2
                            ? Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  pageBuilder:
                                      (_, animation, secondaryAnimation) =>
                                          BranchScreen(),
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
                            : index == 3
                                ? Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      pageBuilder:
                                          (_, animation, secondaryAnimation) =>
                                              GenderSelectionScreen(),
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
                                : null;
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(settingData[index].imagePath),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              settingData[index].title,
                              style: const TextStyle(
                                color: Color(0xFF292929),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (index == settingData.length - 1)
                            FlutterSwitch(
                              value: switchStates,
                              onToggle: (val) {
                                setState(() {
                                  switchStates = val;
                                  switchStates == true
                                      ? Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration: const Duration(
                                                milliseconds: 300),
                                            pageBuilder: (_, animation,
                                                    secondaryAnimation) =>
                                                NotificationScreen(),
                                            transitionsBuilder:
                                                (_, animation, __, child) {
                                              const begin = Offset(
                                                  -1.0, 0.0); // from left
                                              const end = Offset.zero;
                                              final tween = Tween(
                                                      begin: begin, end: end)
                                                  .chain(CurveTween(
                                                      curve: Curves.easeOut));
                                              return SlideTransition(
                                                position:
                                                    animation.drive(tween),
                                                child: child,
                                              );
                                            },
                                          ),
                                        )
                                      : null;
                                });
                              },
                              width: 48,
                              height: 24,
                              toggleSize: 20,
                              activeColor: Color(0xff664F42),
                              inactiveColor: Colors.white,
                              inactiveSwitchBorder:
                                  Border.all(color: Color(0xFFFAD8C4)),
                              toggleColor: const Color(0xFFFAD8C4),
                              activeToggleColor: Colors.white,
                              borderRadius: 30.0,
                              padding: 1.5,
                            )
                          else
                            const CircleAvatar(
                              radius: 12,
                              backgroundColor: Color(0xf16737373),
                              child: Icon(Icons.keyboard_arrow_right_rounded,
                                  color: Color(0xff664F42), size: 15),
                            ),
                        ],
                      ),
                    ),
                    if (index != settingData.length - 1) ...[
                      const SizedBox(height: 12),
                      const Divider(
                          thickness: 1, height: 1, color: Color(0xf16737373)),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: List.generate(
                settingDataOne.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        index == 0
                            ? Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  pageBuilder:
                                      (_, animation, secondaryAnimation) =>
                                          CopyCode(),
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
                            : null;
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(settingDataOne[index].imagePath),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              settingDataOne[index].title,
                              style: const TextStyle(
                                color: Color(0xFF292929),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (index == 0 || index == 1)
                            const CircleAvatar(
                              radius: 12,
                              backgroundColor: Color(0xf16737373),
                              child: Icon(Icons.keyboard_arrow_right_rounded,
                                  color: Color(0xff664F42), size: 15),
                            ),
                        ],
                      ),
                    ),
                    if (index != settingDataOne.length - 1) ...[
                      const SizedBox(height: 12),
                      const Divider(
                          thickness: 1, height: 1, color: Color(0xf16737373)),
                      const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: List.generate(
                settingDataTwo.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(settingDataTwo[index].imagePath),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            settingDataTwo[index].title,
                            style: const TextStyle(
                              color: Color(0xFF292929),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (index == 0 || index == 1)
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xf16737373),
                            child: Icon(Icons.keyboard_arrow_right_rounded,
                                color: Color(0xff664F42), size: 15),
                          ),
                      ],
                    ),
                    if (index != settingDataTwo.length - 1) ...[
                      const SizedBox(height: 12),
                      const Divider(
                          thickness: 1, height: 1, color: Color(0xf16737373)),
                      const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

final List<DiscoverModel> settingData = [
  DiscoverModel(imagePath: "assets/chat_main/star.svg", title: "Rate us"),
  DiscoverModel(
      imagePath: "assets/chat_main/phone-lock.svg",
      title: "Home screen/ lock screen"),
  DiscoverModel(imagePath: "assets/chat_main/plus-circle.svg", title: "Branch"),
  DiscoverModel(imagePath: "assets/chat_main/gender.svg", title: "Gender"),
  DiscoverModel(
      imagePath: "assets/chat_main/notification.svg", title: "Notifications"),
];
final List<DiscoverModel> settingDataOne = [
  DiscoverModel(
      imagePath: "assets/chat_main/copy.svg", title: "Copy referral code"),
  DiscoverModel(
      imagePath: "assets/chat_main/information.svg", title: "Contact support"),
  DiscoverModel(
      imagePath: "assets/chat_main/reply-rectangle.svg",
      title: "Restore purchases"),
  DiscoverModel(imagePath: "assets/chat_main/logout.svg", title: "Log out"),
];
final List<DiscoverModel> settingDataTwo = [
  DiscoverModel(
      imagePath: "assets/chat_main/document-text.svg",
      title: "Terms & conditions"),
  DiscoverModel(
      imagePath: "assets/chat_main/warning-error.svg", title: "Privacy policy"),
  DiscoverModel(
      imagePath: "assets/chat_main/trash.svg", title: "Delete account"),
];
