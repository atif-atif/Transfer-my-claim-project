// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/utils/app_constant.dart';
// import 'package:lawyer/utils/colors.dart';
// import 'package:lawyer/widgets/custom_button.dart';
// import 'package:lawyer/widgets/pincode_textfield.dart';
// import '../controller/otp_controller.dart';

// class OtpScreen extends StatefulWidget {
//   OtpScreen({Key? key}) : super(key: key);

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   OtpController otpController = Get.put(OtpController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: AppColor.whiteColor,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColor.whiteColor,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: AppConstant.screenHorizontalPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 104.h),
//               Text(
//                 'Verification Code',
//                 style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: 8.h,
//               ),
//               SizedBox(
//                 width: 313.w,
//                 child: Wrap(
//                   children: [
//                     Text(
//                       'We just send you a verify code. Check your email to get them.',
//                       style: TextStyle(
//                         color: AppColor.greyColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 32.h,
//               ),
//               PinCodeTextField(
//                 controller: otpController.txtPinInput.value,
//                 onChange: (val) {
//                   otpController.txtPinInput.refresh();
//                 },
//               ),
//               SizedBox(
//                 height: 32.h,
//               ),
//               Obx(
//                 () => CustomButton(
//                     text: "Continue",
//                     isDisable: otpController.txtPinInput.value.text.length != 6,
//                     action: () {
//                       otpController.verifyOtp();
//                     }),
//               ),
//               SizedBox(
//                 height: 17.h,
//               ),
//               Obx(
//                 () => Visibility(
//                   visible: otpController.remainingTime.value != "00:00",
//                   child: Center(
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Resend code in ',
//                           style: TextStyle(color: AppColor.greyColor),
//                         ),
//                         Text(
//                           "${otpController.remainingTime}",
//                           style: TextStyle(
//                               color: AppColor.secondaryColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => Visibility(
//                   visible: otpController.remainingTime.value == "00:00",
//                   child: Center(
//                       child: TextButton(
//                     onPressed: otpController.resending.isTrue
//                         ? () {}
//                         : () {
//                             otpController.resendOtp();
//                           },
//                     child: Text(
//                       otpController.resending.isTrue
//                           ? "Please wait..."
//                           : "RESEND",
//                       style: TextStyle(
//                           color: AppColor.secondaryColor,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }

//   @override
//   void initState() {
//     otpController.startTimer();
//   }
// }
