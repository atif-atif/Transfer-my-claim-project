import 'package:lawyer/appconstants/RepeatedVarables.dart';

Future<dynamic>get_user(id)async{
  var data=await FIRESTORE.collection(ROLE=="L"?"users":"lawyers").doc(id).get();
return data.data();
}