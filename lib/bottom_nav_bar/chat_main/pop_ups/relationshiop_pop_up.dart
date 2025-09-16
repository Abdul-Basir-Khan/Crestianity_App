import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/question_of_faith_screen/question_of_faith.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';

class RelationshipPopUp extends StatefulWidget {
  const RelationshipPopUp({super.key});

  @override
  State<RelationshipPopUp> createState() => _RelationshipPopUpState();
}

class _RelationshipPopUpState extends State<RelationshipPopUp> {
  final List textData=[
    'How can I build stronger relationships through Christian values?',
    'What does the Bible say about forgiveness in relationships?',
    'How can I show love and kindness in my daily interactions?',
    'How can I handle conflict in a way that honors God?',
    'What does the Bible teach about marriage and partnerships?',
    'How can I maintain healthy boundaries while loving others?',
    'How can I pray for my relationships?',
    'How can I be a better friend through faith?',
    'How can I support my loved ones in their spiritual journeys?',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                'You might want to ask about...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF101010),
                  fontSize: 20,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close,color: Color(0xff101010),))

            ],
          ),

          SizedBox(height: 12),
          ...List.generate(textData.length, (index)=> _buildRelationshipRow(context, textData[index], (){})),
          SizedBox(height: 12,),
          CustomButton(onTap: (){
            Navigator.pop(context);
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration:
                const Duration(milliseconds: 300),
                pageBuilder:
                    (_, animation, secondaryAnimation) =>
                   QuestionOfFaithChat(),
                transitionsBuilder:
                    (_, animation, __, child) {
                  const begin =
                  Offset(-1.0, 0.0); // from left
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end)
                      .chain(
                      CurveTween(curve: Curves.easeOut));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );


          },title: "Ask your own question",isRequiredArrow: false,)

        ],
      ),
    );
  }

  Widget _buildRelationshipRow(BuildContext context, String title, VoidCallback onTapArrow){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
               title,
                style: TextStyle(
                  color: const Color(0xFF292929),
                  fontSize: 14,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
            GestureDetector(
              onTap: onTapArrow,
              child: CircleAvatar(
                radius: 12,
                backgroundColor:Color(0xf16737373),
                child: Icon(Icons.keyboard_arrow_right_rounded,color: Color(0xff664F42),size: 15,),
              ),
            )

          ],
        ),
        SizedBox(height: 12,),
        Divider(thickness: 1,height: 1,color: Color(0xf16737373),),
        SizedBox(height: 12,),
      ],
    );
  }
}
