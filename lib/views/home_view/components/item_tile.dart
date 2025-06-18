import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';

class ItemTile extends StatelessWidget {
  final String title;
  final String keyword1;
  final String keyword2;
  final String keyword3;
  final String category1;
  final String category2;
  final Color tileColor;
  final Color textColor;
  final VoidCallback? onTap;
  const ItemTile({
    super.key,
    required this.title,
    required this.keyword1,
    required this.keyword2,
    required this.keyword3,
    required this.category1,
    required this.category2,
    this.tileColor = Colors.white,
    this.textColor = Colors.black,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 25),
            SizedBox(width: 20),
      
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: title,
                  color: textColor,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
      
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  children: [
                    AppText(title: keyword1, size: 12, color: textColor),
                    AppText(title: keyword1, size: 12, color: textColor),
                    AppText(title: keyword1, size: 12, color: textColor),
                  ],
                ),
                SizedBox(height: 10),
      
                Row(
                  spacing: 10,
                  children: [
                    AppText(title: keyword2, size: 12, color: textColor),
                    AppText(title: category2, size: 12, color: textColor),
                  ],
                ),
      
                SizedBox(height: 5),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: onTap,
                  child: AppText(
                    title: "View Details",
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
