import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final double? buttonRadius;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.child,
    required this.onTap,
    this.buttonColor,
    this.buttonHeight,
    this.buttonRadius,
    this.buttonWidth,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    Color primary = buttonColor ?? AppColors.primary_color;
    Color disabledColor = primary.withValues(alpha: 0.4);

    return SizedBox(
      height: buttonHeight ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          overlayColor:
              buttonColor == AppColors.text_secondary_color
                  ? AppColors.white
                  : AppColors.text_secondary_color,
          backgroundColor: isDisabled ? disabledColor : primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius ?? 50),
          ),
        ),
        onPressed: isDisabled ? () {} : onTap,
        child: Center(child: child),
      ),
    );
  }
}
