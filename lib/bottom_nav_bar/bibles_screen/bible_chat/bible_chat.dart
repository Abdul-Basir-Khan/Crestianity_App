import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cristianity_app/widget/reusable_text_form.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';
import 'package:svg_flutter/svg.dart';

class BibleChat extends StatefulWidget {
  const BibleChat({super.key});

  @override
  State<BibleChat> createState() => _BibleChatState();
}

class _BibleChatState extends State<BibleChat> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  bool _showPremiumBanner = true;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _showPremiumBanner = !_focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFFa9a69d),
                    child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/home_screen/Registration 1.png"),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1.43, color: Color(0xFF664F42)),
                          borderRadius: BorderRadius.circular(85.71),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      right: -4,
                      child: Container(
                        width: 23,
                        height: 23,
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF664F42),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2, color: Color(0xFFFFFAEB)),
                            borderRadius: BorderRadius.circular(120),
                          ),
                        ),
                        child: SvgPicture.asset("assets/onboarding_screen/reload.svg"),
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/home_navigation/font-size.svg"),
              ],
            ),

            SizedBox(height: 10,),
            // Messages area
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Initial greeting
                  _buildMessageBubble("Greetings, my brothers and sisters in Christ! How can I be of service to you today?"),

                  // User messages
                  for (final msg in _messages) _buildMessageBubble(msg),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Go Premium Banner
            if (_showPremiumBanner)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Invite your friends',
                        style: TextStyle(
                          color: Color(0xFF737373),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '1 week premium for free',
                        style: TextStyle(
                          color: Color(0xFF737373),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Go Premium',
                    style: TextStyle(
                      color: Color(0xFF664F42),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 10),

            // Text input
            ReusableTextForm(
              controller: _controller,
              focusNode: _focusNode,
              hintText: "Type your question here...",
              borderColor: Colors.transparent,
              filledColor: const Color(0xF80EDEDED),
              suffixIcon: GestureDetector(
                onTap: _sendMessage,
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: SvgPicture.asset("assets/onboarding_screen/send fast.svg"),
                ),
              ),
              focusBorderColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            margin: const EdgeInsets.only(right: 10),
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/home_screen/Registration 1.png"),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1.43, color: Color(0xFF664F42)),
                borderRadius: BorderRadius.circular(85.71),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onLongPressStart: (details) {
                final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                PopupMenu(
                  context: context,
                  config: const MenuConfig(
                    maxColumn: 4,
                    backgroundColor: Colors.black,
                    highlightColor: Colors.white10,
                    lineColor: Colors.transparent,
                  ),
                  items: [
                    PopUpMenuItem(title: 'Like', image: SvgPicture.asset("assets/onboarding_screen/like.svg")),
                    PopUpMenuItem(title: 'Copy', image: SvgPicture.asset("assets/onboarding_screen/copy.svg")),
                    PopUpMenuItem(title: 'Share', image: SvgPicture.asset("assets/onboarding_screen/share.svg")),
            ],
                  onClickMenu: (item) {
                    if (item.menuTitle == "Copy") {
                      Clipboard.setData(ClipboardData(text: message));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Copied to clipboard")),
                      );
                    }
                    else if(item.menuTitle == "Ask question"){
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
                    }
                  },
                ).show(rect: Rect.fromPoints(details.globalPosition, details.globalPosition));
              },
              child: Text(
                message,
                style: const TextStyle(
                  color: Color(0xFF292929),
                  fontSize: 16,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
