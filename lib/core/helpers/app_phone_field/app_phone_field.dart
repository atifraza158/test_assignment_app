import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';


class AppPhoneField extends StatelessWidget {
  const AppPhoneField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.filled,
    this.borderColor,
    this.validator,
    this.onChanged,
    this.initialCountryCode = 'KW',
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool? filled;
  final Color? borderColor;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final Function(PhoneNumber)? onChanged;
  final String initialCountryCode;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: initialCountryCode,
      onChanged: onChanged,
      validator: validator,

      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        counter: SizedBox.shrink(),

        hintText: hintText ?? 'Phone Number',
        fillColor: fillColor ?? AppColors.fieldBgColor,
        filled: filled ?? true,
        contentPadding: const EdgeInsets.only(left: 25, top: 18, bottom: 18),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? AppColors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? AppColors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyWithLowOpacity,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
