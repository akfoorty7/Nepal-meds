import 'package:get/get.dart';

class Validators {
  static String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Cannot leave empty';
    }
    return null;
  }

  static String? validateMobileNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Cannot leave empty';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Cannot leave empty';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validatePasswordMatch(String? value, String? confirmPassword) {
    if (value == null || confirmPassword == null) {
      return null;
    }
    if (value != confirmPassword) {
      return 'Passwords do not match';
    }
    if (value.length <= 8) {
      return 'Passwords should be of 8 character';
    }
    return null;
  }
  static String? validatepassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Cannot leave empty';
    }
    if (value.length <= 8) {
      return 'Passwords should be of 8 character';
    }
    return null;
  }
}
