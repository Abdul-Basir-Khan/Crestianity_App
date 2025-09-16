import 'package:flutter/material.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/registeration_screen_one.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/home_screen/Registration 1.png"),fit: BoxFit.cover,)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text(
              'Seek guidance\nand wisdom',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 31.99,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24,),
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: const Color(0xFFFBEBE0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.80),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x16664F42),
              blurRadius: 6,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Container(
              padding: const EdgeInsets.all(5.33),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFFED4C2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.18),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 SvgPicture.asset("assets/onboarding_screen/chat 02.svg")
                ],
              ),
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Ask your questions about relationships, faith & forgiveness.',
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 10,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),SizedBox(width: 10,),
    Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: const Color(0xFFF0F0FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.80),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x16664F42),
              blurRadius: 6,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Container(
              padding: const EdgeInsets.all(5.33),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFD0D1FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.18),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/onboarding_screen/grid 01.svg")
                ],
              ),
            ),
            Text(
              'Quiz',
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Test your knowledge of the Bible and its message.',
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 10,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    ),SizedBox(width: 10,),
    Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: const Color(0xFFF5FBF0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.80),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x16664F42),
              blurRadius: 6,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Container(
              padding: const EdgeInsets.all(5.33),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFDFF2CF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.18),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/onboarding_screen/online learning.svg")
                ],
              ),
            ),
            Text(
              'Learn',
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Dive deeper into the teachings of Jesus Christ.',
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 10,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ),
    ),
  ],
),
            Spacer(),
            CustomButton(onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (_, animation, secondaryAnimation) => RegistrationScreenOne(),
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

            }),

          ],
        ),
      ),
    );
  }
}
