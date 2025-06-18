import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:test_assignment_app/api/data_controller/data_controller.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/helpers/app_button/app_button.dart';
import 'package:test_assignment_app/core/helpers/app_field/app_field.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';
import 'package:test_assignment_app/views/add_feature/feature_controller.dart';
import 'package:test_assignment_app/views/navbar_view/navbar_view.dart';

// ignore: must_be_immutable
class AddFeature extends StatelessWidget {
  AddFeature({super.key});

  FeatureController controller = Get.put(FeatureController());
  DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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

              AppField(
                hintText: "Feature Name",
                controller: controller.featureName,
              ),
              SizedBox(height: 10),
              AppField(
                hintText: "Category",
                controller: controller.categoryName,
              ),
              SizedBox(height: 10),
              AppField(
                maxLines: 3,
                hintText: "Description",
                fieldRadius: 20,
                controller: controller.description,
              ),
              SizedBox(height: 30),
              AppButton(
                child: Obx(
                  () =>
                      dataController.loader.value
                          ? CircularProgressIndicator(color: AppColors.white)
                          : AppText(
                            title: "Add Feature",
                            size: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                ),
                onTap: () {
                  dataController
                      .saveFeature(
                        featureName: controller.featureName.text,
                        categoryName: controller.categoryName.text,
                        userId: controller.userId!,
                        description: controller.description.text,
                      )
                      .whenComplete(() {
                        Get.offAll(() => NavbarView());
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
