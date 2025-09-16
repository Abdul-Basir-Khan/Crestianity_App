import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/chat_main.dart';
import 'package:my_cristianity_app/widget/reusable_text_form.dart';
import 'package:svg_flutter/svg.dart';

class CopyCode extends StatefulWidget {
  const CopyCode({super.key});

  @override
  State<CopyCode> createState() => _CopyCodeState();
}

class _CopyCodeState extends State<CopyCode> {
  bool switchStates=false;
  String referralLink=   'YTAW42';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFAEB),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFAEB),
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded,color: Color(0xff101010),)),
        title: Text(
          'Copy referral code',
          style: TextStyle(
            color: const Color(0xFF101010),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
            child: Text(
              'Invite a friend and get 1 week of premium for free',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF101010),
                fontSize: 24,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w500,
                height: 1.35,
                letterSpacing: -0.24,
              ),
            ),
          ),
         SizedBox(height: 25,),

         Stack(
           clipBehavior: Clip.none,
           children: [
             Image.asset(
                 fit: BoxFit.cover,
                 "assets/chat_main/Group 1000022161.png"),
             Positioned(
               top: 20,left: 0,right: 0,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Center(
                     child: Text(
                       'Your referral code',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color: const Color(0xFF292929),
                         fontSize: 16,
                         fontFamily: 'Manrope',
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                   ),
                   SizedBox(height: 10,),
                   Center(
                     child: SizedBox(
                         width: MediaQuery.sizeOf(context).width*0.35,
                         child: Container(
                           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                           decoration: ShapeDecoration(
                             color: Colors.white,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(120),
                             ),
                           ),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(
                                 referralLink,
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   color: const Color(0xFF101010),
                                   fontSize: 16,
                                   fontFamily: 'Manrope',
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               Spacer(),
                               GestureDetector(
                                   onTap: (){
                                     Clipboard.setData(ClipboardData(text: referralLink));
                                     // ScaffoldMessenger.of(context).showSnackBar(
                                     //   const SnackBar(
                                     //     content: Text('Link copied to clipboard'),
                                     //   ),
                                     // );
                                   },
                                   child: SvgPicture.asset("assets/chat_main/copy.svg"))
                             ],
                           ),
                         )
                     ),
                   ),
                 ],
               ),
             )
           ],
         )

        ],
      ),
    );
  }
}
