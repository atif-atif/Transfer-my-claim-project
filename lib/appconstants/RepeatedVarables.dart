import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

User? USER_ = FirebaseAuth.instance.currentUser;
FirebaseFirestore FIRESTORE = FirebaseFirestore.instance;
FirebaseStorage STORAGE = FirebaseStorage.instance;
String ROLE='';
var USER_PROFILE;