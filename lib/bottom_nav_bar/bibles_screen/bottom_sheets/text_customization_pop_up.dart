import 'package:flutter/material.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../widget/reusable_text_form.dart';

class TextCustomizationPopUp extends StatefulWidget {
  const TextCustomizationPopUp({super.key});

  @override
  State<TextCustomizationPopUp> createState() => _TextCustomizationPopUpState();
}

class _TextCustomizationPopUpState extends State<TextCustomizationPopUp> {
  double _sliderValue = 2.0;
  @override
  Widget build(BuildContext context) {
    return

      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Text size',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF292929),
                fontSize: 24,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.24,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Drag to slider to adjust the preferred\nreading size',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF737373),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 28,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'A-',
                  style: TextStyle( color: const Color(0xFF292929),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child:

                  SfSlider(
                    min: 0.0,
                    max: 4.0,
                    value: _sliderValue,
                    interval: 1,
                    stepSize: 1,
                    dividerShape:SfDividerShape(),
                    showTicks: false,
                    enableTooltip: false,
                    showDividers: true,
                    activeColor: const Color(0xff664F42),
                    inactiveColor: const Color(0xFFEAEAEA),
                    thumbIcon: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff664F42),
                      ),
                    ),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _sliderValue = newValue;
                      });
                    },
                  ),
                ),
                const Text(
                  'A+',
                  style: TextStyle(   color: const Color(0xFF292929),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28,),
          ],
        ),
      );
  }

}

