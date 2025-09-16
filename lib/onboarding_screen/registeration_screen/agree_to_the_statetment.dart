import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/onboarding_screen/registeration_screen/breakthrough_screen.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';




class AgreeToTheStatementScreen extends StatefulWidget {
  const AgreeToTheStatementScreen({super.key});

  @override
  _AgreeToTheStatementScreenState createState() => _AgreeToTheStatementScreenState();
}

class _AgreeToTheStatementScreenState extends State<AgreeToTheStatementScreen> {
  // Track multiple selected indices.
  int? _selectedIndex;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAEB),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            LinearProgressBar(
              maxSteps: 100,
              minHeight: 4,
              progressType: LinearProgressBar.progressTypeLinear,
              currentStep: 20,
              progressColor: const Color(0xFF664F42),
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 24),
            const Text(
              'Do you agree with\nthis statement?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF292929),
                fontSize: 24,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height:50),
            Text(
              'Dedicating moments to spiritual practice brings harmony to my daily life.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 20,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0; // Yes selected
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: _selectedIndex==0?ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFFF7D3BD),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x28F3BD9C),
                            blurRadius: 0,
                            offset: Offset(0, 0),
                            spreadRadius: 3,
                          )
                        ],
                      ):
                      ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFFF9E1D1),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:  const Color(0xFF664F42)
                            ),
                            child: Icon(Icons.done,color: Colors.white,size: 15,),
                          ),
                          Text(
                            'Yes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF292929),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1; // No selected
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: _selectedIndex==1?ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFFF7D3BD),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x28F3BD9C),
                            blurRadius: 0,
                            offset: Offset(0, 0),
                            spreadRadius: 3,
                          )
                        ],
                      ):ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFFF9E1D1),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:  const Color(0xFF664F42)
                            ),
                            child: Icon(Icons.close,color: Colors.white,size: 15,),
                          ),
                          Text(
                            'No',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF292929),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height:10),
            CustomButton(
              onTap: () {
                if (_selectedIndex==null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select at least one option"),
                    ),
                  );
                  return;
                }
                // Navigation logic here.
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, animation, secondaryAnimation) =>BreakThroughScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      const begin = Offset(-1.0, 0.0); // from left
                      const end = Offset.zero;
                      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOut));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );

              },
              bgColor: _selectedIndex == null
                  ? const Color(0xFFDDAC8E)
                  : const Color(0xFF664F42),
            ),
          ],
        ),
      ),
    );
  }
}
