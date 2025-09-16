import 'package:flutter/material.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class StayConnectedBottomSheet extends StatelessWidget {
  const StayConnectedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFFBEBE0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: const Color(0x28F3BD9C),
                  ),
                  borderRadius: BorderRadius.circular(120),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x28F3BD9C),
                    blurRadius: 0,
                    offset: Offset(0, 0),
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SvgPicture.asset("assets/onboarding_screen/notification.svg")
                ],
              ),
            ),
          ),
          Center(child: Image.asset("assets/onboarding_screen/44998019_9080572 1.png")),
          SizedBox(height: 26,),
          Text(
            'Stay connected to the myChristianity',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF292929),
              fontSize: 32,
              fontFamily: 'Quincy CF',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.32,
            ),
          ),
          SizedBox(height: 8,),
          Text(
            'Allow notifications to get closer \nto the world of God',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF737373),
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24,),
          CustomButton(onTap: (){},isRequiredArrow: false,),
          SizedBox(height: 8,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
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
                  'Maybe later',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF664F42),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.48,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12,),



        ],
      ),
    );
  }
}
