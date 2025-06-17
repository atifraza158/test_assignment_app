import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: AppColors.black)),
        SizedBox(width: 10),
        AppText(title: "or", size: 16, fontWeight: FontWeight.w700),
        SizedBox(width: 10),
        Expanded(child: Divider(thickness: 1, color: AppColors.black)),
      ],
    );
  }
}
