// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class PickImageFromCameraGallery extends StatefulWidget {
//   @override
//   _PickImageFromCameraGalleryState createState() =>
//       _PickImageFromCameraGalleryState();
// }

// class _PickImageFromCameraGalleryState
//     extends State<PickImageFromCameraGallery> {
//   final ImagePicker _picker = ImagePicker();
//   PickedFile? _imageFile;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.getImage(source: source);
//     setState(() {
//       _imageFile = pickedFile!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pick an Image'),
//       ),
//       body: Center(
//         child: _imageFile != null
//             ? Image.file(
//                 File(_imageFile!.path),
//                 fit: BoxFit.cover,
//               )
//             : const Text('No image selected'),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () => _pickImage(ImageSource.camera),
//             child: const Icon(Icons.camera_alt),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: () => _pickImage(ImageSource.gallery),
//             child: const Icon(Icons.image),
//           ),
//         ],
//       ),
//     );
//   }
// }




