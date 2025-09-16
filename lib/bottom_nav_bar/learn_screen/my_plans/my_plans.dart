import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/pop_up/deletion_pop_up.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';

import '../learn_main_screen.dart';


class MyPlans extends StatefulWidget {
  const MyPlans({super.key});

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  bool isExplored=false;
  final List<ParentModel> planData=[
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),
    ParentModel(title: "James & Jude explained | mature faith, real wisdom", image: "assets/learning_screen/Rectangle 1176 (1).png",),


  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:

     isExplored==false?
     Center(
        child:

        ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            Image.asset("assets/learning_screen/Frame.png"),
            Text(
              'Nothing to show',
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
              'You don’t have any study plans in progress. Explore\nnow to get closer to God',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF737373),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 40,),
            CustomButton(onTap: (){
              setState(() {
                isExplored=!isExplored;
              });
            },title: "Explore",isRequiredArrow: false,)
            

          ],
        ),
      ):ListView(
       padding: EdgeInsets.symmetric(horizontal: 15),
       children: [
         SizedBox(height: 16,),
         ...List.generate(planData.length, (index)=> _buildPlan(planData[index].image, planData[index].title,),),
         SizedBox(height: 10,),


       ],
     ),

    );
  }
  Widget _buildPlan(  String image,
      String title,){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(image),
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF101010),
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

              ],
            ),
          ),
          PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 30,
                      onTap: () {
                        showDialog(context: context, builder: (BuildContext context) { return DeletionPopUp(); },);
                      },
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xffC2B9B3),
                            child: Icon(Icons.close,color: Color(0xff664F42),),
                          ),

                          SizedBox(width: 10,),
                          Text(
                            'Remove form list',
                            style: TextStyle(
                              color: const Color(0xFF292929),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                        ],
                      )
                  ),

                ];
              },
              offset: const Offset(0, 30),
              color: Colors.white,
              surfaceTintColor: Colors.white,
              icon:    Icon(
                Icons.more_horiz,
                color: Color(0xff101010),
              )
          ),
        ],
      ),
    );
  }
}
