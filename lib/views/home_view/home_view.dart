import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';
import 'package:test_assignment_app/views/add_feature/add_feature.dart';
import 'package:test_assignment_app/views/home_view/components/feature_button.dart';
import 'package:test_assignment_app/views/home_view/components/item_tile.dart';
import 'package:test_assignment_app/views/home_view/components/search_field.dart';
import 'package:test_assignment_app/views/home_view/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();
  String searchQuery = '';
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.bg_color,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              AppText(
                title: "Welcome, ${user?.email ?? 'User'}",
                size: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary_color,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value.toLowerCase().trim();
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  FeatureButton(
                    onTap: () {
                      Get.to(() => AddFeature());
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: AppText(
                  title: "Features List",
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance
                          .collection('Features')
                          .orderBy('createdAt', descending: true)
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: AppText(title: "No features found."),
                      );
                    }

                    final allFeatures =
                        snapshot.data!.docs
                            .map((doc) => doc.data() as Map<String, dynamic>)
                            .toList();

                    final filteredFeatures =
                        searchQuery.isEmpty
                            ? allFeatures
                            : allFeatures.where((feature) {
                              final name =
                                  feature['featureName']?.toLowerCase() ?? '';
                              return name.contains(searchQuery);
                            }).toList();

                    if (filteredFeatures.isEmpty) {
                      return Center(
                        child: AppText(title: "No matching results."),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: filteredFeatures.length,
                      itemBuilder: (context, index) {
                        final data = filteredFeatures[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ItemTile(
                            title: data['featureName'] ?? '',
                            keyword1: data['categoryName'] ?? '',
                            keyword2: data['description'] ?? '',
                            keyword3: '',
                            category1: '',
                            category2: '',
                            tileColor: AppColors.white,
                            textColor: AppColors.black,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    title: AppText(title: "Feature Details"),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        infoTile(
                                          key: "Feature Name",
                                          value: "${data['featureName'] ?? ''}",
                                        ),

                                        infoTile(
                                          key: "Category",
                                          value:
                                              "${data['categoryName'] ?? ''}",
                                        ),

                                        infoTile(
                                          key: "Description",
                                          value: "${data['description'] ?? ''}",
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: AppText(title: "Okay"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoTile({required String key, required String value}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(title: "$key: "),
        AppText(title: value, size: 15, fontWeight: FontWeight.w600),
      ],
    );
  }
}
