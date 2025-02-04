import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalmeds/API/registration/AuthService.dart';
import 'package:nepalmeds/UI/signup/signup_view.dart';
import '../login/signin.dart';

class SignUpController extends GetxController {
  var username =''.obs;
  var email =''.obs;
  var password =''.obs;
  var confirmpassword =''.obs;
  var passwordObscure = true.obs;
  var confirmPasswordObscure = true.obs;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullnameController = TextEditingController();
  final mobilenumberController = TextEditingController();

  void togglePasswordObscure() {
    passwordObscure.value = !passwordObscure.value;
  }

  void toggleConfirmPasswordObscure() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  Future<String> signUp() async {
    String result = await AuthService().signUp(
        emailController.text,
        passwordController.text,
        fullnameController.text,
        mobilenumberController.text
    );
    if (result == "Success") {
      Get.snackbar('Signup Success', 'Welcome, ${fullnameController.text}!');
      Get.to(() => SignInPage()); // Navigate to sign in page after successful signup
    } else {
      Get.snackbar('Signup Failed', 'Error: $result');
    }
    return result;
  }

  void navigateToSignInPage() {
    Get.to(() => SignInPage());
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nepalmeds/API/registration/AuthService.dart';
// import 'package:nepalmeds/UI/signup/signup_view.dart';
//
// import '../login/signin.dart';
//
// class SignUpController extends GetxController {
//
//   var username =''.obs;
//   var email =''.obs;
//   var password =''.obs;
//   var confirmpassword =''.obs;
//   var passwordObscure = true.obs;
//   var confirmPasswordObscure = true.obs;
//
//
//   final usernameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final fullnameController = TextEditingController();
//   final mobilenumberController = TextEditingController();
//
//
//   void togglePasswordObscure() {
//     passwordObscure.value = !passwordObscure.value;
//   }
//
//   void toggleConfirmPasswordObscure() {
//     confirmPasswordObscure.value = !confirmPasswordObscure.value;
//   }
//
//   Future<String> signUp() async {
//
//     String result = await AuthService().signUp(emailController.text, passwordController.text,fullnameController.text,mobilenumberController.text);
//     if (result == "Success") {
//       Get.snackbar('Login Success', ' Welcome!, ${fullnameController.text}');
//       Get.to(SignUpPage());
//     } else {
//       Get.snackbar('Login Failed', 'Try agian');
//     }
//     return result;
//
//   }
//
//   void navigateToSignInPage() {
//     Get.to(()=>SignInPage());
//   }
// }