import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';

class SocialLoginWidget extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  final Color? iconColor;
  const SocialLoginWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: AppColors.transparent,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(icon, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
