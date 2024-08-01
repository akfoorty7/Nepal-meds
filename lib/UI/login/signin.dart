import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nepalmeds/UI/login/signincontroller.dart';
import '../../common widget/custom_text_form.dart';
import '../../common widget/validators.dart';
import '../signup/signup_view.dart';

class SignInPage extends StatelessWidget{
  final _signinController = Get.put(SignInController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login to your Account',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined, color: Colors.blue),
                        SizedBox(width: 10.w),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: _signinController.emailController,
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      validator: Validators.validateEmail,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        const Icon(Icons.lock, color: Colors.blue),
                        SizedBox(width: 10.w),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return TextFormField(
                        controller: _signinController.passwordController,
                        obscureText: _signinController.passwordObscure.value,
                        decoration: InputDecoration(
                          hintText: '********',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: _signinController.togglePasswordObscure,
                            child: Icon(
                              _signinController.passwordObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) => Validators.validateNotEmpty(value),
                      );
                    }),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          _signinController.signIn();
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => SignUpPage());
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}