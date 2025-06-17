import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:get/get.dart';
import 'package:test_assignment_app/api/auth_controller/auth_controller.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/field_validators/field_validators.dart';
import 'package:test_assignment_app/core/helpers/app_button/app_button.dart';
import 'package:test_assignment_app/core/helpers/app_dropdown_widget/app_dropdown_widget.dart';
import 'package:test_assignment_app/core/helpers/app_field/app_field.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';
import 'package:test_assignment_app/views/auth_views/signin_view/signin_view.dart';
import 'package:test_assignment_app/views/auth_views/signup_view/signup_controller/signup_controller.dart';

// ignore: must_be_immutable
class SignupView extends StatelessWidget {
  SignupView({super.key});

  SignupController controller = Get.put(SignupController());
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background Shapes Design
            Positioned(
              bottom: -30,
              left: 0,
              child: CustomPaint(
                size: Size(screenWidth, screenWidth * 0.5833),
                painter: RPSCustomPainter(),
              ),
            ),

            // Front Side Signup Design.
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 120),
                        AppText(
                          title: "Create Account",
                          size: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary_color,
                        ),
                        SizedBox(height: 15),

                        AppText(
                          title: "Join the community of healers",
                          size: 14,
                        ),
                        SizedBox(height: 15),

                        Container(
                          padding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              labelText("Full Name"),
                              AppField(
                                hintText: "Enter your full name",
                                controller: controller.nameController,
                                validator: FieldValidators.notEmpty,
                              ),

                              // Email
                              labelText("Email"),
                              AppField(
                                hintText: "Enter your email",
                                controller: controller.emailController,
                                validator: FieldValidators.emailValidation,
                              ),

                              labelText("Practitioner Type"),
                              Obx(
                                () => AppDropdownField<String>(
                                  hintText: 'Select your practitioner type',
                                  value:
                                      controller.selectedPractitionerType.value,
                                  items:
                                      controller.practitionTypes
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                  onChanged: controller.setPractitioner,
                                  validator: FieldValidators.notEmpty,
                                ),
                              ),

                              labelText("Practitioner Type"),
                              Obx(
                                () => AppDropdownField<String>(
                                  hintText: 'Select Country',
                                  value: controller.selectedCountry.value,
                                  items:
                                      controller.countries
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                  onChanged: controller.setCountry,
                                  validator: FieldValidators.notEmpty,
                                ),
                              ),

                              labelText("Password"),
                              Obx(
                                () => AppField(
                                  hintText: "Enter Password",
                                  controller: controller.passwordController,
                                  obsecureText:
                                      controller.isPasswordHidden.value,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(
                                      Linecons.key,
                                      color: AppColors.primary_color,
                                      size: 20,
                                    ),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: IconButton(
                                      icon: Icon(
                                        controller.isPasswordHidden.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: AppColors.grey,
                                      ),
                                      onPressed:
                                          controller.togglePasswordVisibility,
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty || val == "") {
                                      return "Password is required";
                                    } else {
                                      return null;
                                    }
                                  },
                                  maxLines: 1,
                                ),
                              ),

                              SizedBox(height: 20),
                              AppButton(
                                child: Obx(
                                  () =>
                                      authController.loader.value
                                          ? CircularProgressIndicator()
                                          : AppText(
                                            title: "Create Account",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                ),

                                onTap: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    authController.signUp(
                                      fullName: controller.nameController.text,
                                      email: controller.emailController.text,
                                      password:
                                          controller.passwordController.text,
                                      practitionerType:
                                          controller
                                              .selectedPractitionerType
                                              .value!,
                                      country:
                                          controller.selectedCountry.value!,
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(title: "Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: AppText(title: "Sign In"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget labelText(String label) {
    return AppText(
      title: label,
      size: 15,
      fontWeight: FontWeight.w700,
      color: AppColors.primary_color,
    );
  }
}
