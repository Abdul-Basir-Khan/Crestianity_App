import 'package:flutter/material.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

import '../../../widget/reusable_text_form.dart';

class SoundSpeedPopUp extends StatefulWidget {
  const SoundSpeedPopUp({super.key});

  @override
  State<SoundSpeedPopUp> createState() => _SoundSpeedPopUpState();
}

class _SoundSpeedPopUpState extends State<SoundSpeedPopUp> {
  final List speedList=[
    '0.75x',
    '1x',
    '1.25x',
    '1.5x',
    '1.75x',
    '2x',
  ];
  int _currentSpeed=1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Speed',
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
                  child: const Icon(Icons.close, color: Color(0xff101010))),
            ],
          ),
        ),
        const SizedBox(height: 10),

        ...List.generate(speedList.length, (index)=> GestureDetector(
          onTap: (){
            setState(() {
              _currentSpeed=index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            decoration: BoxDecoration(
              color:_currentSpeed==index?Color(0x28F3BD9C):Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                 speedList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF292929),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                _currentSpeed==index?CircleAvatar(
                  radius: 8,
                  backgroundColor:Color(0xFF664F42),
                  child: Icon(Icons.done,size: 10,color: Colors.white,),
                ):CircleAvatar(
                  radius: 8,
                  backgroundColor:Colors.transparent,
                  child: Icon(Icons.done,size: 5,color: Colors.white,),
                ),
              ],
            ),
          ),
        ),

        ),
        const SizedBox(height: 10),

      ],
    );
  }

}

