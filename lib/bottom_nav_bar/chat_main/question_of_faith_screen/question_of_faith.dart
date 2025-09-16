import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cristianity_app/widget/reusable_text_form.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';
import 'package:svg_flutter/svg.dart';

class QuestionOfFaithChat extends StatefulWidget {
  const QuestionOfFaithChat({super.key});

  @override
  State<QuestionOfFaithChat> createState() => _QuestionOfFaithChatState();
}

class _QuestionOfFaithChatState extends State<QuestionOfFaithChat> {
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
      backgroundColor: Color(0xffFFFAEB),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFAEB),
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_rounded,color: Color(0xff101010),)),
        title: Text(
          'Questions of faith',
          style: TextStyle(
            color: const Color(0xFF101010),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          SvgPicture.asset("assets/home_navigation/search 8.svg"),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          SizedBox(height: 10,),
          // Messages area
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: [
                Text(
                  'myChristianity',
                  style: TextStyle(
                    color: const Color(0x7F737373),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
               SizedBox(height: 4,),
                Text(
                  'What questions about faith do you have?',
                  style: TextStyle(
                    color: const Color(0xFF292929),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
               // User messages
                for (final msg in _messages) _buildMessageBubble(msg),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Go Premium Banner
          if (_showPremiumBanner)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
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
                  Text(
                    'Go Premium',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFF3BD9C),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.48,
                    ),
                  )
                ],
              ),
            ),


          // Text input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: ReusableTextForm(
              controller: _controller,
              focusNode: _focusNode,
              hintText: "|Ask me anything...",
              borderColor: Colors.transparent,
              filledColor: Color(0xFFEDEDED),
              suffixIcon: GestureDetector(
                onTap: _sendMessage,
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: SvgPicture.asset("assets/onboarding_screen/send fast.svg"),
                ),
              ),
              focusBorderColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // align user's message to right
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8, // prevent overflow
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            margin: const EdgeInsets.only(top: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0x2BAD866F),
                  blurRadius: 14.30,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Color(0xFF664F42),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                height: 1.25,
                letterSpacing: -0.48,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
