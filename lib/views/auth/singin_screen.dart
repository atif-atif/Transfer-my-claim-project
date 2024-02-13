import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lawyer/_not%20used/authentication/controller/register_controller.dart';
import 'package:lawyer/apis/getlawyer.dart';
import 'package:lawyer/appconstants/RepeatedVarables.dart';
import 'package:lawyer/views/auth/forget.dart';
import 'package:lawyer/views/dashboard/admin/admin.dart';
import 'package:lawyer/views/nav_bar.dart';
import 'package:lawyer/widgets/authentication_logo.dart';
import 'package:lawyer/widgets/custom_text.dart';
import 'package:lawyer/widgets/tile_subtitle.dart';
import 'package:lawyer/controllers/choose_role_controller.dart';
import 'package:lawyer/utils/app_constant.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/auth/registration.dart';
import 'package:lawyer/views/bottom_bar.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_textfield.dart';

import '../actions/notifications.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   authController.emailFocusNode.value.addListener(() {
  //     authController.emailFocusNode.refresh();
  //   });
  //   authController.passwordFocusNode.value.addListener(() {
  //     authController.passwordFocusNode.refresh();
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    // authController.emailFocusNode.value.dispose();
    // authController.passwordFocusNode.value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstant.screenHorizontalPadding),
        child: Obx(
          () => Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 63 - MediaQuery.of(context).viewPadding.top),
                SizedBox(height: 26.h),
                CustomText(
                  'Login',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  label: "E-mail",
                  controller: emailcontroller,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? ' Enter a valid Email'
                          : null,
                  onSaved: (value) {
                    emailcontroller.text = value!;
                  },
                  focusNode: emailFocusNode.value,
                ),
                CustomTextField(
                  label: "Password",
                  controller: passontroller,
                  focusNode: passwordFocusNode.value,
                  bottomPadding: 64.h,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Please Enter Password");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Please Enter Valid Password(Min 6 character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passontroller.text = value!;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ForgetPassword());
                      },
                      child: CustomText(
                        'Forget password?',
                        color: AppColor.Red_COLOR,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomButton(
                    text: "Login",
                    action: () {
                      loginAction();
                    }),
                roleController.currentRoleStatus.value == RoleStatus.USER ||
                        roleController.currentRoleStatus.value ==
                            RoleStatus.LAWYER
                    ? Column(
                        children: [
                          SizedBox(height: 33.h),
                          Center(
                            child: Text(
                              "or",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 24.sp),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          CustomButton(
                            text: "Register",
                            action: () {
                              Get.off(const RegistrationScreen());
                            },
                            isSecondaryButton: true,
                            color: AppColor.secondaryColor,
                          ),
                          SizedBox(height: 4.h),
                          Center(
                            child: Text(
                              "For New users only",
                              style: TextStyle(
                                color: AppColor.greyColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h)
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    ));
  }

  var passwordFocusNode = FocusNode().obs;
  var emailFocusNode = FocusNode().obs;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void loginAction() async {
    if (_formKey.currentState!.validate()) {
      try {
        showcirculer(context);
        await _auth.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passontroller.text.trim(),
        );

        if (ROLE == 'L') {
          var doc = await getlawyer(_auth.currentUser?.uid);
          if (doc.exists) {
            var map = doc.data() as Map<dynamic, dynamic>;
            if (map['enableflg'] == false) {
              Fluttertoast.showToast(
                gravity: ToastGravity.CENTER,
                toastLength: Toast.LENGTH_LONG,
                msg: "Your request is pending!!",
              );
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              return;
            }
          }
        }
        var find = await FIRESTORE
            .collection(ROLE == 'L'
                ? "lawyers"
                : ROLE == 'U'
                    ? 'users'
                    : 'admin')
            .doc(_auth.currentUser?.uid)
            .get();
        if (!find.exists) {
          Fluttertoast.showToast(
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_LONG,
            msg: "User not found!!",
          );
          Navigator.pop(context);
          await FirebaseAuth.instance.signOut();
          return;
        }
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.pop(context);
        Get.off((ROLE == 'A') ? const AdminScreen() : BottomNavBar());
      } catch (e) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  final roleController = Get.put(ChooseRoleController());
  // final authController = Get.put(AuthController());
}
