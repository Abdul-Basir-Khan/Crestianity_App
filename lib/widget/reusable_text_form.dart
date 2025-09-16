import 'package:flutter/material.dart';

class ReusableTextForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color filledColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final String? hintText;
  final String? prefixText;
  final bool? obscureText;
  final double? borderRadius;
  final bool? enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextCapitalization? capitalize;
  final int? maxLine;
  final Color? textColor;
  final bool autofocus;
  final bool?isRead;
  final FocusNode? focusNode; // ✅ NEW

  const ReusableTextForm({
    super.key,
    this.validator,
    this.controller,
    this.keyboardType,
    this.textColor = const Color(0xFF101010),
    this.capitalize = TextCapitalization.none,
    this.hintText,
    this.suffixIcon,
    this.maxLine = 1,
    this.obscureText = false,
    this.enabled = true,
    this.prefixIcon,
    this.filledColor = Colors.white,
    this.borderColor,
    this.focusBorderColor,
    this.autofocus = false,
    this.focusNode, this.borderRadius, this.prefixText, this.isRead=false, // ✅ NEW
  });

  @override
  Widget build(BuildContext context) {
    return

      TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      textCapitalization: capitalize!,
      maxLines: maxLine!,
      autofocus: autofocus,
      readOnly: isRead!,
      focusNode: focusNode, // ✅ use it here
      style: TextStyle(color: textColor!),
      decoration: InputDecoration(
        prefixText: prefixText,
        filled: true,
        prefixStyle:  TextStyle(
          color: const Color(0xFF101010),
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
        ),
        fillColor: filledColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabled: enabled!,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF8E8E8E),
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
          height: 1.50,
        ),
        contentPadding: const EdgeInsets.all(10),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius?? 120),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??120),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??120),
          borderSide: BorderSide(color: borderColor ?? const Color(0xFFF3BD9C)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??120),
          borderSide: BorderSide(color: focusBorderColor ?? const Color(0xFFF3BD9C)),
        ),
      ),
      validator: validator,
    );
  }
}
