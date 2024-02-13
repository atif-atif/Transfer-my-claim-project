// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/Services/auth_service.dart';
// import 'package:lawyer/authentication/view/signup/registration.dart';
// import 'package:lawyer/models/user_model.dart';
// import 'package:lawyer/views/bottom_bar.dart';

// class AuthController extends GetxController {

//   String? fullName;
//   String? email;
//   String? password;

//   var emailFocusNode = FocusNode().obs;
//   var passwordFocusNode = FocusNode().obs;
//   var ownerNameFocusNode = FocusNode().obs;
//   var ownerEmailFocusNode = FocusNode().obs;
//   var ownerPasswordFocusNode = FocusNode().obs;


//   var nameController = TextEditingController().obs;
//   var emailController = TextEditingController().obs;
//   var passController = TextEditingController().obs;
//   // var resetEmailController = TextEditingController().obs;
//   // var txtOwnerName = TextEditingController().obs;
//   // var txtOwnerEmail = TextEditingController().obs;
//   // var txtOwnerPassword = TextEditingController().obs;
//   // var managerNotifyEmail = false.obs;
//   // var chefNotifyEmail = false.obs;


//   var loginFormKey = GlobalKey<FormState>();
//   var registerFormKey = GlobalKey<FormState>();
//   var resetFormKey = GlobalKey<FormState>();

//   // validateForm() {
//   //   formKey.currentState?.validate();
//   // }

//   loginButtonAction() async{
//     email = emailController.value.text.trim();
//     password = passController.value.text.trim();

//     if (loginFormKey.currentState!.validate()) {
//       // showWaitButton.value = true;
//       bool result = await AuthServices.login(email, password);
//       if (result == true) {
//         resetSignInFields();
//         Fluttertoast.showToast(msg: 'Login Successful');
//         Get.to(BottomBar());
//       }
//       // showWaitButton.value = false;
//     }
//     // roleController.getCurrentRole();
//     Get.off(const RegistrationScreen());

//   }
//   registerButtonAction() {
//     // Get.to(CreateManagerScreen());
//   }

//   resetAccount() async {
//     // showWaitButton.value = true;
//     if (resetFormKey.currentState!.validate()) {
//       email = emailController.value.text.trim();
//       bool result = await AuthServices.resetPassword(email!);
//       if (result == true) {
//         Fluttertoast.showToast(msg: 'Reset Link sent Successfully');
//       }
//     }
//     // showWaitButton.value = false;
//   }


//   final _auth = FirebaseAuth.instance;
  
//   Future<void> signUp() async {
//     // log(
//     //   emailController.text +
//     //       " " +
//     //       numberController.text +
//     //       " " +
//     //       passwordController.text +
//     //       " " +
//     //       locationController.text +
//     //       " " +
//     //       lastnameController.text +
//     //       " " +
//     //       genderof.toString(),
//     // );
//     if (registerFormKey.currentState!.validate()) {
//       // showcirculer(context);
//       await _auth
//           .createUserWithEmailAndPassword(
//             email: emailController.value.text.trim(),
//             password: passController.value.text.trim(),
//           )
//           .then(
//             (uid) => {postDetailsToFirebase()},
//           )
//           .catchError((e) {
//         Navigator.pop(context);
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     }
//   }

//   postDetailsToFirebase() async {
//     User? user = _auth.currentUser;
//     AppUserModel.userId = user!.uid;
//     AppUserModel.firstName = firstNameController.text.trim();
//     AppUserModel.lastName = lastNameController.text.trim();
//     AppUserModel.email = signUpEmailController.text.trim();
//     AppUserModel.userName = usernameController.text.trim();

//     await FireStoreServices.uploadUserData(AppUserModel).then((value){
//       resetSignUpFields();
//       Get.to(Home());
//     }).onError((error, stackTrace){
//       MyAlert.showToast(error.toString());
//     });
//     showWaitButton.value = false;
//   }

//   resetRegisterFields(){
//     nameController.value.text='';
//     emailController.value.text='';
//     passController.value.text='';
//   }

//   resetSignInFields(){
//     emailController.value.text='';
//     passController.value.text='';
//   }
// }
