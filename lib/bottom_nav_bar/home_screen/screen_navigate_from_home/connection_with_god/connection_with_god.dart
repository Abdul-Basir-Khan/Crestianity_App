import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/screen_navigate_from_home/daily_verse/daily_verse.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:svg_flutter/svg.dart';


class ConnectionWithGod extends StatefulWidget {
  const ConnectionWithGod({super.key});

  @override
  State<ConnectionWithGod> createState() => _ConnectionWithGodState();
}

class _ConnectionWithGodState extends State<ConnectionWithGod> {
  double percent = 0.4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 15,right: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/home_navigation/connectionwithGod.png"))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff8c8c7a),
                    child: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                ),
                Text(
                  'Connection with God',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF101010),
                    fontSize: 20,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff8c8c7a),
                  child: Icon(Icons.close,color: Colors.white,),
                ),

              ],
            ),
            SizedBox(height: 100,),
            Text(
              'How strong is your connection to God today?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 32,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.32,
              ),
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SvgPicture.asset("assets/home_navigation/hand.svg"),
                Expanded(
                  child: FlutterSlider(
                    values: [percent * 100],
                    max: 100,
                    min: 0,
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(), // No shadow
                      child: Container(
                        height: 30,
                        width: 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      inactiveTrackBarHeight: 16,
                      activeTrackBarHeight: 16,
                      inactiveTrackBar: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFFAD866F),
                          Color(0xFF664F42),
                        ]),
                        borderRadius: BorderRadius.circular(120),
                      ),
                      activeTrackBar: BoxDecoration(
                        color: Color(0xf50737373),
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        percent = lowerValue / 100;
                      });
                    },
                  ),
                ),

              SvgPicture.asset("assets/home_navigation/hand1.svg"),
              ],
            ),
            SizedBox(height: 10,),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration:
                      const Duration(milliseconds: 300),
                      pageBuilder:
                          (_, animation, secondaryAnimation) =>
                          DailyVerse(),
                      transitionsBuilder:
                          (_, animation, __, child) {
                        const begin =
                        Offset(-1.0, 0.0); // from left
                        const end = Offset.zero;
                        final tween =
                        Tween(begin: begin, end: end).chain(
                            CurveTween(
                                curve: Curves.easeOut));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white.withValues(alpha: 102),
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
                      Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF101010),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.48,
                        ),
                      ),
                      Icon(Icons.arrow_forward,color: Color(0xff101010),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}


