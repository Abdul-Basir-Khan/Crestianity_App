import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/pop_ups/relationshiop_pop_up.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/setting_screen.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/bottom_sheets/start_plan_bottom_sheet.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/learn_explaination/learn_explaination.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../chat_main/chat_main.dart';

class LearnDetails extends StatefulWidget {
  const LearnDetails({super.key});

  @override
  State<LearnDetails> createState() => _LearnDetailsState();
}

class _LearnDetailsState extends State<LearnDetails> {
  final List<DiscoverModel> thinkList=[
    DiscoverModel(imagePath: "assets/chat_main/family-is-gathered-around-table-with-pumpkin-family-people-background_369680169.htm_log-in=google.png", title:     'Thanksgiving and\nworship',),
    DiscoverModel(imagePath: "assets/chat_main/2.png", title:     'Thankfulness for\ncommunity and family',),
    DiscoverModel(imagePath: "assets/chat_main/family-is-gathered-around-table-with-pumpkin-family-people-background_369680169.htm_log-in=google.png", title:     'Thanksgiving and\nworship',),
  ];

  bool isSavedForLater=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height*0.34,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/learning_screen/Holy_Family.png"))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xf50737373),
                      child: Icon(Icons.arrow_back_rounded,color: Colors.white,),
                    ),
                  ),
                  Text(
                    'Plan info',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset("assets/learning_screen/share.svg",color: Colors.white,)


                ],
              ),
            ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'James & Jude explained | mature faith, real wisdom',
                  style: TextStyle(
                    color: const Color(0xFF101010),
                    fontSize: 24,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.24,
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: ShapeDecoration(
                        color: const Color(0x28737373),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 7,
                        children: [
                         SvgPicture.asset("assets/learning_screen/calendar.svg"),
                          Text(
                            '5 Days',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFA8A8A8),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: ShapeDecoration(
                        color: const Color(0x28737373),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 7,
                        children: [
                         SvgPicture.asset("assets/learning_screen/chair.svg"),
                          Text(
                            '30.573 Enrolled',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFA8A8A8),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                GestureDetector(
                  onTap: (){

                    setState(() {
                      isSavedForLater=!isSavedForLater;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFBEBE0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      children: [
                       Icon(Icons.favorite_border_rounded,color: Color(0xff664F42),),
                        Text(
                          'Save for later',
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
                ),
                SizedBox(height: 24,),
                Text(
                  'Time to grow up. James wants us to mature in our walk with God, and he writes a letter chock full of down-to-earth wisdom to help us get there. Join Kris Langham for daily audio guides through the Bible\'s most practical book. Joy in trials; quick to listen & slow to speak; humble wisdom; living faith is active. Plus perseverance in the last days in Jude\'s epistle!\nMore from',
                  style: TextStyle(
                    color: const Color(0xFF101010),
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24,),
           Visibility(
             visible: isSavedForLater,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Container(
                   padding: EdgeInsets.all(15),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Image.asset("assets/learning_screen/image.png"),
                           SizedBox(width: 10),
                           Text(
                             'St. Christophorus Church',
                             style: TextStyle(
                               color: const Color(0xFF292929),
                               fontSize: 14,
                               fontFamily: 'Manrope',
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 16,),
                       Text(
                         'These reading plans were created with the support of the St. Christophorus Church. \nWe are deeply grateful for their partnership',
                         style: TextStyle(
                           color: const Color(0xFF292929),
                           fontSize: 14,
                           fontFamily: 'Manrope',
                           fontWeight: FontWeight.w400,
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 24,),
                 Text(
                   'Related plans',
                   style: TextStyle(
                     color: const Color(0xFF101010),
                     fontSize: 20,
                     fontFamily: 'Quincy CF',
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 SizedBox(height: 24,),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children: List.generate(thinkList.length, (index)=> Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Image.asset(thinkList[index].imagePath),
                           SizedBox(height: 10,),
                           Text(
                             thinkList[index].title,
                             style: TextStyle(
                               color: const Color(0xFF101010),
                               fontSize: 16,
                               fontFamily: 'Manrope',
                               fontWeight: FontWeight.w400,
                             ),
                           )
                         ],),
                     )),
                   ),
                 ),
                 SizedBox(height: 12,),
               ],
             ),
           ),
                isSavedForLater==false?SizedBox(height: MediaQuery.sizeOf(context).height*0.14,):SizedBox(),
                CustomButton(
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
                              child: SizedBox( height: MediaQuery.sizeOf(context).height * 0.85,
                                  child:StartPlanBottomSheet()), // 👈 your custom content
                            ),
                          );
                        },
                      );
                    }
                ,isRequiredArrow: false,title: "Start Plan",),
                SizedBox(height: 12,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

