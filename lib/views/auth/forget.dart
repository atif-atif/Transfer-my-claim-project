import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/utils/sized.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_text.dart';
import 'package:lawyer/widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  // AuthController authController = Get.put(AuthController());
  ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: PADDING,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 43.h),
              const BackButton(color: Colors.black),
              SizedBox(height: 55.h),
              pageTitle(),
              SizedBox(height: 16.h),
              pageDescription(),
              SizedBox(height: 16.h),
              emailField(),
              SizedBox(height: 50.h),
              resetButton(),
              SizedBox(height: 276.h),
            ],
          ),
        ),
      ),
    );
  }

  pageTitle() {
    return CustomText(
      'Forgot Your Password?',
      fontSize: 24.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  pageDescription() {
    return CustomText(
      'You will receive an email to \nupdate your password',
      color: Colors.black,
    );
  }

  emailField() {
    return CustomTextFormField(
      // hintText: 'Email Address',
      'Email Address',
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // controller: authController.resetEmailController,
      textInputAction: TextInputAction.done,
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? ' Enter a valid Email'
          : null,
      onSaved: (value) {
        emailController.text = value!;
      },
    );
  }

  final emailController = TextEditingController();
  resetButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: 'Reset',
          textColor: Colors.black,
          width: 190.w,
          action: () async {
            resetUser();
            // Get.back();
            // authController.resetAccount();
            // Get.dialog(
            //   resetPageDialog(),
            //   barrierDismissible: false,
            // );

            // await FirebaseAuth.instance.sendPasswordResetEmail(email: 'kamrandev@nestedpie.com');
            // await FirebaseAuth.instance.sendPasswordResetEmail(
            //   email: authController.emailController.text.trim(),
            // );
            // authController.resetAccount();
          },
          // ),
        ),
      ],
    );
  }

  final _auth = FirebaseAuth.instance;
  resetUser() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
    }
    Fluttertoast.showToast(msg: 'Reset Link sent Successfully');
    Get.back();
  }

  // resetAccount() async {
  //   // showWaitButton.value = true;
  //   // if (formkey[2].currentState!.validate()) {
  //     email = emailController.text.trim();
  //     bool result = await AuthServices.resetPassword(email!);
  //     if (result == true) {
  //       Fluttertoast.showToast(msg: 'Reset Link sent Successfully');
  //     }
  //   // }
  //   // showWaitButton.value = false;
  // }
}
