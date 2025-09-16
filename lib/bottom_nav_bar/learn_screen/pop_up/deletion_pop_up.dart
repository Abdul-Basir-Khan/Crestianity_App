import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';


class DeletionPopUp extends StatelessWidget {

  const DeletionPopUp({super.key,});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xF40F79963),
                child: SvgPicture.asset(height: 25,width: 25,"assets/chat_main/warning.svg"),
              ),
              SizedBox(height: 25,),
              Text(
                'Do you want to remove\nfrom list saved?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF292929),
                  fontSize: 24,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(height: 24,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
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
                          Text(
                            'Cancel',
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
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF664F42),
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
                            'Yes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 6,),


            ],
          ),
        ),
      ),
    );
  }
}