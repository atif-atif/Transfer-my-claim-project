import '../utils/SharedPreferencesUser.dart';
import 'checkrole.dart';

Future<dynamic>setRoles({role})async{

    if(role.toUpperCase()=='USER')
    await SharedPreferencesUser.setUserType('U');
   else if(role.toUpperCase()=='LAWYER')
   await SharedPreferencesUser.setUserType('L');
   else if(role.toUpperCase()=='ADMIN')
   await SharedPreferencesUser.setUserType('A');

    await checkrole();

}