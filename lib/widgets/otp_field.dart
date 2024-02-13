// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sm_cranes/consts/app_colors.dart';

// class OTPField extends StatelessWidget {
//   final TextEditingController? controller;

//   const OTPField({
//     Key? key,
//     this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 56.h,
//       width: 56.w,
//       child: TextField(
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           isDense: true,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16.r),
//             borderSide: const BorderSide(color: APP_LIGHT_COLOR),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16.r),
//             borderSide: const BorderSide(color: TEXT_FIELD_BORDER_COLOR),
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 23, horizontal: 23),
//         ),
//       ),
//     );
//   }
// }
