import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';

class FeatureButton extends StatelessWidget {
  final VoidCallback? onTap;
  const FeatureButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: AppText(
          title: "New Feature",
          size: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
