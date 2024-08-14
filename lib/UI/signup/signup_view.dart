import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nepalmeds/UI/login/signin.dart';
import 'package:nepalmeds/common%20widget/validators.dart';

import 'signup_controller.dart';

class SignUpPage extends StatelessWidget {
  final _signupController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _signupController.fullnameController,
                  validator: Validators.validateNotEmpty,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _signupController.emailController,
                  validator: Validators.validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _signupController.mobilenumberController,
                  validator: Validators.validateMobileNumber,
                  decoration: InputDecoration(
                    labelText: 'mobileNumber',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Obx((){
                  return TextFormField(
                    controller: _signupController.passwordController,
                    obscureText: _signupController.passwordObscure.value,
                    validator: (value) => Validators.validatepassword(value),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_signupController.passwordObscure.value ? Icons.visibility_off : Icons.visibility),
                        onPressed: _signupController.togglePasswordObscure,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  );
                }),
                SizedBox(height: 16.0),
                Obx((){
                  return TextFormField(
                    controller: _signupController.confirmPasswordController,
                    obscureText: _signupController.confirmPasswordObscure.value,
                    validator: (value) => Validators.validatePasswordMatch(
                        _signupController.passwordController.text,
                        value),
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            _signupController.confirmPasswordObscure.value ? Icons.visibility_off : Icons.visibility),
                        onPressed: _signupController.toggleConfirmPasswordObscure,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  );
                }),
                SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signupController.signUp();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.w, vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}