import 'package:lawyer/appconstants/RepeatedVarables.dart';

import '../utils/SharedPreferencesUser.dart';

Future<dynamic>checkrole()async{
  ROLE=await SharedPreferencesUser.getUserType();
  return ROLE;

}