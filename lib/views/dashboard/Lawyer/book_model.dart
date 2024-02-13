import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookConsulationModel {
  String? fullName;
  String? email;
  String? phone;
  String? query;

  BookConsulationModel({
    this.fullName,
    this.email,
    this.phone,
    this.query,
  });
  factory BookConsulationModel.fromMap(map) {
    return BookConsulationModel(
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
      query: map['query'],
    );
  }

//sending
  Map<String, dynamic> tomap() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'query': query,
    };
  }

  static Future<BookConsulationModel> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDocument = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return BookConsulationModel.fromMap(userDocument.data());
    }
    var guestUser = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection('userName')
        .get();
    return BookConsulationModel.fromMap(guestUser);
  }
}
