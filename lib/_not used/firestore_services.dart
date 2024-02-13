// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lawyer/models/user_model.dart';
// import 'firebase_exceptions.dart';

// class FireStoreServices {

//  static var usersCollection=FirebaseFirestore.instance.collection('Users');

//   static Future<AppUserModel> getUser() async {
//     try {
//       String userId = FirebaseAuth.instance.currentUser!.uid;
//       DocumentSnapshot documentSnapshot = await usersCollection.doc(userId)
//           .get();
//       AppUserModel _userModel = AppUserModel.fromJson(
//           documentSnapshot.data() as Map<String, dynamic>);
//       return _userModel;
//     }on FirebaseException catch(firebase){
//       throw FirebaseExceptions(firebase);
//     }
//     catch(e){
//       throw e.toString();
//     }
//   }

//   static Future uploadUserData(AppUserModel userModel) async {
//     try {
//       await usersCollection.doc(userModel.userId).set(userModel.toJson());
//       return true;
//     } on FirebaseException catch(firebase){
//       throw FirebaseExceptions(firebase);
//     }
//     catch(e){
//       throw e.toString();
//     }
//   }
//   static Future updateUseDate(var map) async {
//     try {
//       String currentUserId=FirebaseAuth.instance.currentUser!.uid;
//       await usersCollection.doc(currentUserId).update(map);
//       return true;
//     } on FirebaseException catch(firebase){
//       throw FirebaseExceptions(firebase);
//     }
//     catch(e){
//       throw e.toString();
//     }
//   }
//  static isUsernameExist(String username) async {
//     QuerySnapshot queryDocumentSnapshot=await usersCollection.where('userName',isEqualTo: username).get();
//     if(queryDocumentSnapshot.size>0){
//       return true;
//     }
//     return false;
//   }
// }
