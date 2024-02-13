import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lawyer/views/nav_bar.dart';
import 'package:lawyer/widgets/custom_text.dart';
import 'package:lawyer/models/user_model.dart';
import 'package:lawyer/utils/app_constant.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/auth/singin_screen.dart';
import 'package:lawyer/views/bottom_bar.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_textfield.dart';

import '../../appconstants/RepeatedVarables.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<String> categorieslist = [
    'Family',
    'Property',
    'Criminal',
    'Civil',
    'Business',
    'Taxation'
  ];
  String? selectedcategory;
  @override
  // void initState() {
  //   super.initState();
  //   ownerNameFocusNode.addListener(() {
  //     authController.ownerNameFocusNode.refresh();
  //   });
  //   authController.ownerEmailFocusNode.value.addListener(() {
  //     authController.ownerEmailFocusNode.refresh();
  //   });
  //   authController.ownerPasswordFocusNode.value.addListener(() {
  //     authController.ownerPasswordFocusNode.refresh();
  //   });
  // }
  void initState() {
    selectedcategory = categorieslist[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      body: SingleChildScrollView(
        child: Padding(
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
                  // AuthenticationLogo(
                  //   backButton: true,
                  // ),
                  SizedBox(height: 27.h),
                  CustomText(
                    'Register',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 27.h),
                  CustomTextField(
                    controller: nameController,
                    label: "Name",
                    validator: (value) {
                      // RegExp regex = RegExp(r'^.{3,}$');
                      if (value!.isEmpty) {
                        return ("Please Enter your Full Name");
                      }
                      // if (!regex.hasMatch(value)) {
                      //   return ("Please Enter Valid Name");
                      // }
                      return null;
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    focusNode: ownerNameFocusNode.value,
                  ),
                  CustomTextField(
                    controller: emailController,
                    label: "Email",
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? ' Enter a valid Email'
                            : null,
                    focusNode: ownerEmailFocusNode.value,
                  ),
                  CustomTextField(
                    controller: passController,
                    label: "Password",
                    onSaved: (value) {
                      passController.text = value!;
                    },
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
                    // textInputAction: TextInputAction.next,
                    focusNode: ownerPasswordFocusNode.value,
                  ),
                  // if (ROLE == "L") SizedBox(height: 7.h),
                  if (ROLE == "L")
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: DropdownButton<String>(
                          value: selectedcategory,
                          items: categorieslist.map(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    value,
                                    style: const TextStyle(),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            selectedcategory = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  SizedBox(height: 50.h),
                  CustomButton(
                      text: "Continue",
                      action: () async {
                        registerAction();
                      }),
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          "or",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24.sp),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomButton(
                        text: "Login",
                        action: () {
                          Get.off(const SignInScreen());
                          // signInController.signInAction();
                        },
                        isSecondaryButton: true,
                        color: AppColor.secondaryColor,
                      ),
                      SizedBox(height: 4.h),
                      Center(
                        child: Text(
                          "For Already exist users",
                          style: TextStyle(
                            color: AppColor.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  var ownerNameFocusNode = FocusNode().obs;
  var ownerEmailFocusNode = FocusNode().obs;
  var ownerPasswordFocusNode = FocusNode().obs;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController bloodgroupController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  Future<void> registerAction() async {
    if (_formKey.currentState!.validate()) {
      showcirculer(context);
      await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim(),
          )
          .then(
            (uid) => {postDetailsToFirebase()},
          )
          .catchError((e) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirebase() async {
    UserModel userModel = UserModel();
    User? user = _auth.currentUser;
    userModel.userName = nameController.text;
    userModel.email = user!.email;
    userModel.uid = user.uid;
    if (ROLE == 'L') {
      userModel.category = selectedcategory;
      userModel.enableflg = false;
    }

    await FIRESTORE
        .collection(ROLE == 'L'
            ? "lawyers"
            : ROLE == 'U'
                ? 'users'
                : 'admin')
        .doc(user.uid)
        .set(
          userModel.tomap(),
        );
    if (ROLE == 'L') {
      await FIRESTORE.collection('requests').doc(user.uid).set({
        'uid': user.uid,
      });
      Navigator.pop(context);
      await FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        msg: "Request sent to admin :)",
      );
      return;
    }

    Fluttertoast.showToast(
      msg: "Account created successfully :)",
    );
    // Navigator.pop(context);
    Get.off(BottomNavBar());
  }
}

void showcirculer(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            CircularProgressIndicator(
              semanticsLabel: 'loading...',
            ),
          ],
        );
      });
}
