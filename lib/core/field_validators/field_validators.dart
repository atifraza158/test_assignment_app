import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:intl_phone_field/phone_number.dart';

class FieldValidators {
  // Email
  static String? emailValidation(String? val) {
    if (val == null || val.isEmpty) {
      return "Email is necessary!";
    } else if (!EmailValidator.validate(val)) {
      return "invalid Email(i,e. abc@example.com)";
    }
    return null;
  }

  // Simple Text
  static String? notEmpty(String? val) {
    if (val == null || val.isEmpty) {
      return "field can't be empty!";
    }
    return null;
  }

  // Phone No.
  static FutureOr<String?> phoneNumberValidator(PhoneNumber? phoneNumber) {
    if (phoneNumber == null || phoneNumber.toString().trim().isEmpty) {
      return 'Phone number is required';
    }

    final number = phoneNumber.toString().replaceAll(RegExp(r'\s+'), '');
    final numericOnly = RegExp(r'^\+?[0-9]+$');

    if (!numericOnly.hasMatch(number)) {
      return 'Only digits and + are allowed';
    }

    if (number.length < 7 || number.length > 15) {
      return 'Enter a valid phone number';
    }

    return null;
  }
}
