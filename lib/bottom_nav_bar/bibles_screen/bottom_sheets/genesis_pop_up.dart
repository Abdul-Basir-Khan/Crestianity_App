import 'package:flutter/material.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

import '../../../widget/reusable_text_form.dart';

class GenesisPopUp extends StatefulWidget {
  const GenesisPopUp({super.key});

  @override
  State<GenesisPopUp> createState() => _GenesisPopUpState();
}

class _GenesisPopUpState extends State<GenesisPopUp> {
  @override
  Widget build(BuildContext context) {
    return

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              const Text(
                'Genesis 1',
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
          const SizedBox(height: 10),
         ReusableTextForm(
           maxLine: 6,
           borderRadius: 2,
           focusBorderColor: Colors.transparent,
           borderColor: Colors.transparent,
           hintText: 'Add your notes...',

         ),
          SizedBox(height: 40,),
          CustomButton(onTap: (){},title: "Save",isRequiredArrow:false,)
        ],
      ),
    );
  }

}

