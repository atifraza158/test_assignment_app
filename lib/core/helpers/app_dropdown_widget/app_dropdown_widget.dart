import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final String? Function(T?)? validator;

  const AppDropdownField({
    super.key,
    required this.items,
    this.hintText,
    this.value,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.borderColor,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor ?? AppColors.fieldBgColor,
        filled: false,
        contentPadding: const EdgeInsets.only(left: 25, top: 18, bottom: 18),
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      dropdownColor: Colors.white,
      icon: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Icon(Icons.keyboard_arrow_down, color: AppColors.primary_color),
      ),
    );
  }
}
