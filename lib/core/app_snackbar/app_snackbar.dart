
import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';

class CustomSnackbar {
  static void showCustomSnackBar(
    BuildContext context,
    String message, {
    bool success = false,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              success
                  ? Icons.check_circle
                  : error
                  ? Icons.error
                  : Icons.info,

              color: Colors.white,
            ),
            SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor:
            success
                ? Colors.green
                : error
                ? Colors.red
                : AppColors.primary_color,

        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
