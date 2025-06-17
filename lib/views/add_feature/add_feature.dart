import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/helpers/app_button/app_button.dart';
import 'package:test_assignment_app/core/helpers/app_field/app_field.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';

class AddFeature extends StatelessWidget {
  const AddFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            AppText(
              title: "Add New Feature",
              size: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary_color,
            ),

            SizedBox(height: 20),

            AppField(hintText: "Feature Name"),
            SizedBox(height: 10),
            AppField(hintText: "Category"),
            SizedBox(height: 10),
            AppField(maxLines: 3, hintText: "Description", fieldRadius: 20),
            SizedBox(height: 30),
            AppButton(
              child: AppText(
                title: "Add Feature",
                size: 16,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
