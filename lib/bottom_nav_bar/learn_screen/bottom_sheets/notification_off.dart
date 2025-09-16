import 'package:flutter/material.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

import '../../../widget/reusable_text_form.dart';

class NotificationOffBottomSheet extends StatelessWidget {
  const NotificationOffBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),

              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, color: Color(0xff101010))),
            ],
          ),
          const SizedBox(height: 10),
          Image.asset("assets/learning_screen/n_off.png"),
          SizedBox(height: 10),
          Text(
            'Notifications off',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF292929),
              fontSize: 24,
              fontFamily: 'Quincy CF',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.24,
            ),
          ),
          SizedBox(height: 16,),
          Text(
            'Get the most out of your Daily Plan, by turning on notifications in your device Settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF737373),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20,),

          Spacer(),
          CustomButton(onTap: (){},title: "Go to Settings",isRequiredArrow: false,)


        ],
      ),
    );
  }
}

