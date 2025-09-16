import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/chat_main.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/copy_code/copy_code.dart';
import 'package:svg_flutter/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool switchStates=false;
  bool switchStatesOne=false;
  bool switchStatesTwo=false;
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
          'Notifications',
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
          Text(
            'Devotionals',
            style: TextStyle(
              color: const Color(0xFF101010),
              fontSize: 20,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Expanded(
                      child:Text(
                        'Daily scripture',
                        style: TextStyle(
                          color: const Color(0xFF292929),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ),

                      FlutterSwitch(
                        value: switchStates,
                        onToggle: (val) {
                          setState(() {
                            switchStates = val;
                          });
                        },
                        width: 48,
                        height: 24,
                        toggleSize: 20,
                        activeColor:Color(0xff664F42),
                        inactiveColor: Colors.white,
                        inactiveSwitchBorder: Border.all(color:  Color(0xFFFAD8C4)),
                        toggleColor: const Color(0xFFFAD8C4),
                        activeToggleColor: Colors.white,
                        borderRadius: 30.0,
                        padding: 1.5,
                      )

                  ],
                ),

    const SizedBox(height: 12),
    const Divider(thickness: 1, height: 1, color: Color(0xf16737373)),
    const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Expanded(
                        child:Text(
                          'Daily devotional reminder',
                          style: TextStyle(
                            color: const Color(0xFF292929),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    ),

                    FlutterSwitch(
                      value: switchStatesOne,
                      onToggle: (val) {
                        setState(() {
                          switchStatesOne = val;
                        });
                      },
                      width: 48,
                      height: 24,
                      toggleSize: 20,
                      activeColor:Color(0xff664F42),
                      inactiveColor: Colors.white,
                      inactiveSwitchBorder: Border.all(color:  Color(0xFFFAD8C4)),
                      toggleColor: const Color(0xFFFAD8C4),
                      activeToggleColor: Colors.white,
                      borderRadius: 30.0,
                      padding: 1.5,
                    )

                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Text(
            'Prayers',
            style: TextStyle(
              color: const Color(0xFF101010),
              fontSize: 20,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Expanded(
                        child:Text(
                          'New prayers availability',
                          style: TextStyle(
                            color: const Color(0xFF292929),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    ),

                    FlutterSwitch(
                      value: switchStatesTwo,
                      onToggle: (val) {
                        setState(() {
                          switchStatesTwo = val;
                        });
                      },
                      width: 48,
                      height: 24,
                      toggleSize: 20,
                      activeColor:Color(0xff664F42),
                      inactiveColor: Colors.white,
                      inactiveSwitchBorder: Border.all(color:  Color(0xFFFAD8C4)),
                      toggleColor: const Color(0xFFFAD8C4),
                      activeToggleColor: Colors.white,
                      borderRadius: 30.0,
                      padding: 1.5,
                    )

                  ],
                ),

              ],
            ),
          ),

          SizedBox(height: 16,),
        ],
      ),
    );
  }
}

