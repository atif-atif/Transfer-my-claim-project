import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../appconstants/RepeatedVarables.dart';


Future<dynamic> get_profile()async{
  try {

    var doc= FirebaseFirestore.instance.collection(ROLE=='U'?'users':"lawyers").doc(USER_?.uid);
    var exist=await doc.get();

   return exist.data();

  }catch(e){}finally{

  }
}