import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalmeds/API/registration/AuthService.dart';

import '../home/NewPage.dart';

class SignInController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var passwordObscure = true.obs;

  void togglePasswordObscure() {
    passwordObscure.value = !passwordObscure.value;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    String result = await AuthService()
        .signIn(emailController.text.trim(), passwordController.text.trim());

    if (result == "Success") {
      Get.snackbar('Login Success', ' Welcome!, ${emailController.text}');
      Get.to(HomePage());
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }
}
