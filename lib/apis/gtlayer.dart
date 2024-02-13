import 'package:cloud_firestore/cloud_firestore.dart';

import '../appconstants/RepeatedVarables.dart';

Future<DocumentSnapshot>getadminlawyer(id)async{
  var doc=await FIRESTORE.collection('lawyers').doc(id).get();

  return doc;
}