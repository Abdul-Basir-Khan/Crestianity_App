import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? height;
  final String? title;
  final double? width;
  final bool? isRequiredArrow;
  final Color? bgColor;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.bgColor,
    required this.onTap, this.title, this.isRequiredArrow=true,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;

  void _triggerSplash() {
    setState(() => _opacity = 0.6);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() => _opacity = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _triggerSplash(); // trigger the flash

        // Delay navigation by 150ms to show splash
        Future.delayed(const Duration(milliseconds: 150), () {
          widget.onTap(); // actual navigation logic
        });// call original action
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: widget.width ?? double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: widget.bgColor ?? const Color(0xFF664F42),
              borderRadius: BorderRadius.circular(120),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  widget.title?? 'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.48,
                  ),
                ),
                SizedBox(width: 10),
                widget.isRequiredArrow==false?SizedBox():Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),

          // Light splash effect
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: widget.width ?? double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                color: Colors.white.withOpacity(0.3), // flash color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
