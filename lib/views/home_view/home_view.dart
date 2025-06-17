import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';
import 'package:test_assignment_app/views/add_feature/add_feature.dart';
import 'package:test_assignment_app/views/home_view/components/feature_button.dart';
import 'package:test_assignment_app/views/home_view/components/item_tile.dart';
import 'package:test_assignment_app/views/home_view/components/search_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            AppText(
              title: "Welcome, username",
              size: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary_color,
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: SearchField()),
                SizedBox(width: 10),
                FeatureButton(
                  onTap: () {
                    Get.to(() => AddFeature());
                  },
                ),
              ],
            ),

            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppText(
                        title: "Items List",
                        size: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: List.generate(10, (i) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ItemTile(
                            title: "Rock Rose",
                            keyword1: "one",
                            keyword2: "two",
                            keyword3: "three",
                            category1: "category 1",
                            category2: "category 2",
                            tileColor:
                                i == 0
                                    ? AppColors.primary_color
                                    : AppColors.white,
                            textColor:
                                i == 0 ? AppColors.white : AppColors.black,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
