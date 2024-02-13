import 'package:cloud_firestore/cloud_firestore.dart';

import '../appconstants/RepeatedVarables.dart';

Future<DocumentSnapshot>getlawyer(id)async{
 var doc=await FIRESTORE.collection(ROLE=="U"?'lawyers':ROLE=="L"?"users":"admin").doc(id).get();

return doc;
}