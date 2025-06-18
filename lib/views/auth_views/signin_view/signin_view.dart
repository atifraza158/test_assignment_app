import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:get/get.dart';
import 'package:test_assignment_app/api/auth_controller/auth_controller.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/core/field_validators/field_validators.dart';
import 'package:test_assignment_app/core/helpers/app_button/app_button.dart';
import 'package:test_assignment_app/core/helpers/app_field/app_field.dart';
import 'package:test_assignment_app/core/helpers/app_text/app_text.dart';
import 'package:test_assignment_app/views/auth_views/signin_view/components/or_widget.dart';
import 'package:test_assignment_app/views/auth_views/signin_view/components/social_login_widget.dart';
import 'package:test_assignment_app/views/auth_views/signin_view/signin_controller/signin_controller.dart';
import 'package:test_assignment_app/views/auth_views/signup_view/signup_view.dart';

// ignore: must_be_immutable
class SigninView extends StatelessWidget {
  SigninView({super.key});

  SigninController controller = Get.put(SigninController());
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background Shapes Design
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/login_shape.png"),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/login_bottom_shape.png"),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        AppText(
                          title: "Welcome Back",
                          size: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary_color,
                        ),
                        SizedBox(height: 15),

                        SizedBox(
                          width: Get.width / 1.7,
                          child: AppText(
                            title: "Signin to continue your healing journey",
                            size: 14,
                            color: AppColors.white,
                            maxLines: 2,
                            overFlow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 15),

                        Container(
                          padding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(29),
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
                              SizedBox(height: 2),
                              // Email
                              labelText("Email"),
                              AppField(
                                hintText: "Enter your email",
                                controller: controller.emailController,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    FontAwesome.mail,
                                    color: AppColors.primary_color,
                                    size: 20,
                                  ),
                                ),
                                validator: FieldValidators.emailValidation,
                              ),

                              labelText("Password"),
                              Obx(
                                () => AppField(
                                  hintText: "Enter Password",
                                  obsecureText:
                                      controller.isPasswordHidden.value,
                                  controller: controller.passwordController,
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

                              // Forgot Password Section
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: AppText(
                                      title: "Forgot Password?",
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),

                              AppButton(
                                child: Obx(
                                  () =>
                                      authController.loader.value
                                          ? CircularProgressIndicator(
                                            color: AppColors.white,
                                          )
                                          : AppText(
                                            title: "Get Started",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                ),
                                onTap: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    authController.login(
                                      email: controller.emailController.text,
                                      password:
                                          controller.passwordController.text,
                                    );
                                  }
                                },
                              ),

                              // Navigate to Signup
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(title: "Don't have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(
                                        () => SignupView(),
                                        transition: Transition.topLevel,
                                      );
                                    },
                                    child: AppText(
                                      title: "SIGN UP",
                                      color: AppColors.primary_color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),

                              // Or Widget
                              OrWidget(),

                              SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    title: "Continue with",
                                    size: 15,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SocialLoginWidget(
                                    icon: "assets/icons/google_logo.png",
                                    onTap: () {
                                      authController.signInWithGoogle();
                                    },
                                    iconColor: AppColors.primary_color,
                                  ),
                                  SocialLoginWidget(
                                    icon: "assets/icons/facebook_logo.png",
                                    onTap: () {},
                                    iconColor: Colors.blueAccent,
                                  ),
                                  SocialLoginWidget(
                                    icon: "assets/icons/apple_logo.png",
                                    onTap: () {},
                                    iconColor: AppColors.primary_color,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
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
