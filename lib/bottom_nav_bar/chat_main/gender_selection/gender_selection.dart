import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/chat_main.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/copy_code/copy_code.dart';
import 'package:svg_flutter/svg.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  final List branchList=[
    'Male',
    'Female',
  ];
  int? selectedIndex;
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
          'Gender',
          style: TextStyle(
            color: const Color(0xFF101010),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
        children: [
          SizedBox(height: 16,),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: List.generate(branchList.length, (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [


                        // Text
                        Expanded(
                          child: Text(
                            branchList[index],
                            style: const TextStyle(
                              color: Color(0xFF292929),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // ✅ Circular Checkbox
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedIndex == index ? Color(0xFF664F42) : Colors.transparent,
                            border: Border.all(
                              color: selectedIndex == index ? Colors.transparent: Color(0xffFBEBE0),
                              width: 1,
                            ),
                          ),
                          child: selectedIndex == index
                              ? const Icon(Icons.check, size: 14, color: Colors.white)
                              : null,
                        ),
                      ],
                    ),
                  ),

                  if (index != branchList.length - 1) ...[
                    const SizedBox(height: 12),
                    const Divider(thickness: 1, height: 1, color: Color(0xf16737373)),
                    const SizedBox(height: 12),
                  ],
                ],
              )),

            ),
          ),


          SizedBox(height: 16,),
        ],
      ),
    );
  }
}

