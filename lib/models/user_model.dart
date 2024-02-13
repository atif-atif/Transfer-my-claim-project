import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userName;
  String? email;
  String? uid;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? experience;
  String? country;
  String? state;
  String? city;
  String? language;
  String? qualification;
  String? specialities;
  String? description;
  String? category;
  bool? enableflg;
  String? image;

  UserModel({
    this.userName,
    this.email,
    this.uid,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.experience,
    this.country,
    this.state,
    this.city,
    this.language,
    this.qualification,
    this.specialities,
    this.description,
    this.category,
    this.enableflg,
    this.image,
  });
  factory UserModel.fromMap(map) {
    return UserModel(
      userName: map['userName']??"",
      email: map['email'],
      uid: map['uid'],
      firstName: map['firstName']??"",
      lastName: map['lastName']??"",
      phoneNumber: map['phoneNumber']??"",
      experience: map['experience']??"",
      country: map['country']??"",
      state: map['state']??"",
      city: map['city']??"",
      language: map['language']??"",
      qualification: map['qualification']??"",
      specialities: map['specialities']??"",
      description: map['description']??"",
      category: map['category']??"",
      enableflg: map['enableflg']??false,
      image: map['image']??"",
    );
  }

//sending
  Map<String, dynamic> tomap() {
    return {
      'userName': userName,
      'email': email,
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'experience': experience,
      'country': country,
      'state': state,
      'city': city,
      'language': language,
      'qualification': qualification,
      'specialities': specialities,
      'description': description,
      'category': category,
      'enableflg': enableflg,
      'image': image,
    };
  }


  static Future<UserModel> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDocument = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return UserModel.fromMap(userDocument.data());
    }
    var guestUser = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection('userName')
        .get();
    return UserModel.fromMap(guestUser);
  }
}
