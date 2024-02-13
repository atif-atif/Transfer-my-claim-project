// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/widgets/custom_text.dart';
// import 'package:image_picker/image_picker.dart';


// class CustomImagePicker extends StatelessWidget {
//   // final CreateDishController createDishController =
//   //     Get.put(CreateDishController());

//   CustomImagePicker({Key? key}) : super(key: key);
//   // final ImagePicker imagePicker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         height: 100.h,
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ListTile(
//                 onTap: () {
//                   _getFromCamera();
//                 },
//                 dense: true,
//                 title: CustomText(
//                   'Camera',
//                 ),
//                 leading: Icon(
//                   Icons.camera_enhance_rounded,
//                   size: 30.h,
//                 )),
//             ListTile(
//                 onTap: () {
//                   _getFromGallery();
//                 },
//                 dense: true,
//                 title: CustomText(
//                   'Gallery',
//                 ),
//                 leading: Icon(
//                   Icons.image,
//                   size: 30.h,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   /// Get from gallery
//   _getFromGallery() async {
//     Get.back();
//     XFile? pickedFile = await imagePicker.pickImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       createDishController.dishImages.value.add(File(pickedFile.path));
//       createDishController.dishImages.refresh();
//     }
//   }

//   /// Get from Camera
//   _getFromCamera() async {
//     Get.back();
//     XFile? pickedFile = await imagePicker.pickImage(
//       source: ImageSource.camera,
//     );
//     if (pickedFile != null) {
//       createDishController.dishImages.value.add(File(pickedFile.path));
//       createDishController.dishImages.refresh();
//     }
//   }
// }
