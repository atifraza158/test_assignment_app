import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';

// ignore: must_be_immutable
class AppField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final Color? fillColor;
  final bool? filled;
  final Color? borderColor;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  final bool obsecureText;
  final void Function(String)? onChanged;
  final double fieldRadius;

  AppField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.maxLength,
    this.maxLines,
    this.suffixIcon,
    this.fillColor,
    this.filled,
    this.borderColor,
    this.keyboardType,
    this.validator,
    this.obsecureText = false,
    this.onChanged,
    this.fieldRadius = 50,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor ?? AppColors.fieldBgColor,
        contentPadding: EdgeInsets.only(left: 25, top: 18, bottom: 18),
        filled: filled ?? false,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey.withValues(alpha: .4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey.withValues(alpha: .4),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey.withValues(alpha: .4),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldRadius),
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(fieldRadius),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
