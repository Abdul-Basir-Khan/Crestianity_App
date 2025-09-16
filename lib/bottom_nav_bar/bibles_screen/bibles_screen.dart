import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bibles_screen/bible_chat/bible_chat.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';
import 'package:svg_flutter/svg.dart';
import 'bottom_sheets/book_pop_up.dart';
import 'bottom_sheets/genesis_pop_up.dart';
import 'bottom_sheets/sound_speed_pop_up.dart';
import 'bottom_sheets/text_customization_pop_up.dart';
import 'bottom_sheets/version_pop_up.dart';

class BiblesScreen extends StatefulWidget {
  const BiblesScreen({super.key});

  @override
  State<BiblesScreen> createState() => _BiblesScreenState();
}

class _BiblesScreenState extends State<BiblesScreen> {
  bool isPlayed = false;
  bool _isPlaying = false; // add this to your State class
  bool isShowTextCustomization = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(height: 10),
                  _buildHeader(context),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, thickness: 1, color: Color(0xff664F42)),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ReusableBibleText(
                          title:
                              '1. In the beginning God created the heaven and the earth.',
                        ),
                        ReusableBibleText(
                          title:
                              '2. And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.',
                        ),
                        ReusableBibleText(
                          title:
                              '3. And God said, Let there be light: and there was light.',
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4. ',
                              style: TextStyle(
                                color: Color(0xFF292929),
                                fontSize: 16,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: ReusableBibleText(
                                title:
                                    'And God saw the light, that it was good: and God divided the light from the darkness.',
                              ),
                            ),
                          ],
                        ),
                        ReusableBibleText(
                          title:
                              "5. And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day.",
                        ),
                        ReusableBibleText(
                          title:
                              "6. And God said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.",
                        ),
                        ReusableBibleText(
                          title:
                              '3. And God said, Let there be light: and there was light.',
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4. ',
                              style: TextStyle(
                                color: Color(0xFF292929),
                                fontSize: 16,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: ReusableBibleText(
                                title:
                                    'And God saw the light, that it was good: and God divided the light from the darkness.',
                              ),
                            ),
                          ],
                        ),
                        ReusableBibleText(
                          title:
                              "5. And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day.",
                        ),
                        ReusableBibleText(
                          title:
                              "6. And God said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.",
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            isPlayed
                ? _buildBottomPlayer()
                : _buildBottomPlayerPlayed(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    padding: MediaQuery.of(context)
                        .viewInsets, // 👈 handles keyboard correctly
                    child: SingleChildScrollView(
                      child: SizedBox( height: MediaQuery.sizeOf(context).height * 0.90,
                          child: BookPopUp()), // 👈 your custom content
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const ShapeDecoration(
                color: Color(0xFFFBEBE0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                    bottomLeft: Radius.circular(120),
                  ),
                ),
              ),
              child: const Text(
                'Genesis 1',
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
          const SizedBox(width: 2),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return Container(
                          height: MediaQuery.sizeOf(context).height * 0.90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: VersionPopUp()));
                    },
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const ShapeDecoration(
                color: Color(0xFFFBEBE0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                ),
              ),
              child: const Text(
                'ASV',
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
          const Spacer(),
          GestureDetector(
              onTap: () {
                setState(() {
                  isPlayed =true;
                  isShowTextCustomization = false;
                });
              },
              child: SvgPicture.asset("assets/home_navigation/speaker.svg")),
          const SizedBox(width: 10),
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
                      padding: MediaQuery.of(context)
                          .viewInsets, // 👈 handles keyboard correctly
                      child: SingleChildScrollView(
                        child: TextCustomizationPopUp(), // 👈 your custom content
                      ),
                    );
                  },
                );
              },
              child: SvgPicture.asset("assets/home_navigation/font-size.svg")),
        ],
      ),
    );
  }

  Widget _buildBottomPlayer() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/home_navigation/previous.svg"),
                  const SizedBox(width: 30),
                  SvgPicture.asset("assets/home_navigation/play.svg"),
                  const SizedBox(width: 30),
                  SvgPicture.asset("assets/home_navigation/next.svg"),
                ],
              ),
              const SizedBox(height: 15),
              const ProgressBar(
                timeLabelTextStyle: TextStyle(
                  color: Color(0xFFA8A8A8),
                  fontSize: 12,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
                progress: Duration(seconds: 100),
                buffered: Duration(seconds: 100),
                total: Duration(seconds: 900),
                progressBarColor: Color(0xffFFCF5F),
                baseBarColor: Color(0xffEDEDED),
                bufferedBarColor: Color(0xffFFCF5F),
                thumbColor: Color(0xffFFCF5F),
                barHeight: 5.0,
                thumbRadius: 5.0,
                onSeek: null,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '1x',
                    style: TextStyle(
                      color: Color(0xFF292929),
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
                            child: SingleChildScrollView(child: SoundSpeedPopUp()),
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.watch_later_outlined,
                      color: Color(0xFF101010),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -60,right: 0,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (_, animation, secondaryAnimation) => const BibleChat(),
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
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/home_screen/Registration 1.png"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF664F42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'PRIEST',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomPlayerPlayed() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Previous button
          CircleAvatar(
            radius: 17,
            backgroundColor: const Color(0xff664F42),
            child: const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),

          // Play/Pause button
          GestureDetector(
            onTap: () {
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            child: CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xff664F42),
              child: Icon(
                _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 38,
              ),
            ),
          ),

          // Next button
          CircleAvatar(
            radius: 17,
            backgroundColor: const Color(0xff664F42),
            child: const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

}

class ReusableBibleText extends StatelessWidget {
  final String title;

  const ReusableBibleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        PopupMenu(
          context: context,
          config: const MenuConfig(
            maxColumn: 4,
            backgroundColor: Colors.black,
            highlightColor: Colors.white10,
            lineColor: Colors.transparent,
          ),
          items: [
            PopUpMenuItem(
                title: 'Copy',
                image: SvgPicture.asset("assets/onboarding_screen/copy.svg")),
            PopUpMenuItem(
                title: 'Share',
                image: SvgPicture.asset("assets/onboarding_screen/share.svg")),
            PopUpMenuItem(
                title: 'Highlight',
                image:
                    SvgPicture.asset("assets/onboarding_screen/highlight.svg")),
            PopUpMenuItem(
                title: 'Note',
                image: SvgPicture.asset(
                    "assets/onboarding_screen/notes-edit-download.svg")),
            PopUpMenuItem(
                title: 'Bookmark',
                image:
                    SvgPicture.asset("assets/onboarding_screen/bookmark.svg")),
            PopUpMenuItem(
                title: 'Priest',
                image: CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        AssetImage("assets/home_screen/Registration 1.png"))),
            PopUpMenuItem(
                title: 'Ask question',
                image: SvgPicture.asset("assets/onboarding_screen/help.svg")),
            PopUpMenuItem(
                title: 'Interpret',
                image: SvgPicture.asset(
                    "assets/onboarding_screen/language-skill-bulk-rounded 1.svg")),
          ],
          onClickMenu: (item) {
            if (item.menuTitle == "Copy") {
              Clipboard.setData(ClipboardData(text: title));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Copied to clipboard")),
              );
            } else if (item.menuTitle == "Priest") {

            } else if (item.menuTitle == "Note") {

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
                        child: GenesisPopUp(), // 👈 your custom content
                      ),
                    );
                  },
                );
            }
          },
        ).show(
            rect: Rect.fromPoints(
                details.globalPosition, details.globalPosition));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF292929),
            fontSize: 16,
            fontFamily: 'Quincy CF',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

