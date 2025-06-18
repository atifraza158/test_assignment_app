import 'package:flutter/material.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/constants/app_constants.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';
import 'package:test_assignment_app/core/helpers/back_button/back_button.dart';

class RemedyDetailsView extends StatelessWidget {
  RemedyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,

            child: Image.asset("assets/shapes/remedy_detail_view.dart.png"),
          ),

          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBackButton(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: AppColors.primary_color,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 130),
                  AppText(
                    title: "Remedy Details",
                    size: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary_color,
                  ),
                  SizedBox(height: 60),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  title: "Rock Rose",
                                  size: 18,
                                  color: AppColors.primary_color,
                                  fontWeight: FontWeight.w700,
                                ),
                                addFormulaButton(onTap: () {}),
                              ],
                            ),

                            SizedBox(height: 10),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(chipLabels.length, (
                                index,
                              ) {
                                return categoryChip(
                                  text: chipLabels[index],
                                  color:
                                      index == 0
                                          ? AppColors.blue
                                          : index == 1
                                          ? AppColors.primary_color
                                          : null,
                                );
                              }),
                            ),

                            SizedBox(height: 20),

                            AppText(
                              title: "Start Formula",
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary_color,
                            ),
                            SizedBox(height: 10),

                            AppText(
                              title: AppConstants.formulaDescription,
                              size: 13,
                              color: AppColors.grey,
                            ),

                            SizedBox(height: 20),

                            AppText(
                              title: "Properties",
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(propertiesList.length, (
                                index,
                              ) {
                                return categoryChip(
                                  text: propertiesList[index],
                                  color: AppColors.blue,
                                );
                              }),
                            ),

                            // Associated Chakras
                            SizedBox(height: 20),

                            AppText(
                              title: "Associated Chakras",
                              size: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary_color,
                            ),
                            SizedBox(height: 10),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(
                                associatedChokars.length,
                                (index) {
                                  return categoryChip(
                                    text: associatedChokars[index],
                                    color: Colors.deepPurple,
                                  );
                                },
                              ),
                            ),

                            // Related Remedies
                            SizedBox(height: 20),

                            AppText(
                              title: "Related Remedies",
                              size: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary_color,
                            ),
                            SizedBox(height: 10),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(associatedChokars.length, (
                                index,
                              ) {
                                return categoryChip(
                                  text: associatedChokars[index],
                                  imageUrl:
                                      "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg",
                                );
                              }),
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addFormulaButton({Function()? onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary_color),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Image.asset("assets/icons/Frame.png"),
          SizedBox(width: 10),
          AppText(title: "Add to Formula", color: AppColors.white),
        ],
      ),
    );
  }

  Widget categoryChip({
    Color? color,
    required String text,
    String imageUrl = "",
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(imageUrl.isNotEmpty ? 35 : 21),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUrl.isNotEmpty)
            CircleAvatar(backgroundImage: NetworkImage(imageUrl), radius: 15),
          if (imageUrl.isNotEmpty) SizedBox(width: 12),
          AppText(
            title: text,
            color: color != null ? AppColors.white : AppColors.black,
          ),
        ],
      ),
    );
  }

  final List<String> chipLabels = [
    "Bach Flower Remedy",
    "Earth",
    "Panic",
    "terror",
    "fear",
    "emergency",
  ];

  final List<String> propertiesList = ["Grounding", "Courage", "Calmness"];
  final List<String> associatedChokars = ["Root", "Solar Plexus"];
}
