import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/pop_up/deletion_pop_up.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';

import '../learn_main_screen.dart';


class SavedTab extends StatefulWidget {
  const SavedTab({super.key});

  @override
  State<SavedTab> createState() => _SavedTabState();
}

class _SavedTabState extends State<SavedTab> {
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

      ListView(
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
          CircleAvatar(
            radius: 15,
            backgroundColor:
            Color(0xff664F42),
            child: Icon(Icons.favorite,color: Colors.white,size: 15,),
          )
        ],
      ),
    );
  }
}
