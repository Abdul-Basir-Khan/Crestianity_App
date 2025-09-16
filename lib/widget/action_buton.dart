import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
class ActionButton extends StatefulWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const ActionButton({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  double _overlayOpacity = 0;

  void _triggerFlash() {
    setState(() => _overlayOpacity = 1);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() => _overlayOpacity = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _triggerFlash();
        // delay the real callback so the flash is visible
        Future.delayed(const Duration(milliseconds: 150), widget.onTap);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ──────────────── your normal button ────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xf94737373),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(33),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(widget.iconPath, color: Colors.white),
                const SizedBox(width: 6),
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // ──────────────── white flash overlay ────────────────
          AnimatedOpacity(
            opacity: _overlayOpacity,
            duration: const Duration(milliseconds: 100),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(33),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
