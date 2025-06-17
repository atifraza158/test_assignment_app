import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var selectedCountry = RxnString();
  var selectedPractitionerType = RxnString();
  var isPasswordHidden = true.obs;

  final List<String> countries = ['Pakistan', 'UAE', 'Kuwait', 'UK'];
  final List<String> practitionTypes = [
    'Option1',
    'Option2',
    'Option3',
    'Option4',
  ];

  void setCountry(String? value) {
    selectedCountry.value = value;
  }

  void setPractitioner(String? value) {
    selectedPractitionerType.value = value;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
