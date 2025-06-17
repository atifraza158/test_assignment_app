import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment_app/api/auth_controller/auth_controller.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';
import 'package:test_assignment_app/views/auth_views/signin_view/signin_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.put(AuthController()).logout().then((_) {
              Get.offAll(() => SigninView());
            });
          },
          child: AppText(title: "Logout"),
        ),
      ),
    );
  }
}
