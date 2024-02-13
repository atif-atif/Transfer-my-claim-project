import 'package:firebase_auth/firebase_auth.dart';

import '../appconstants/RepeatedVarables.dart';

Future<dynamic>uploadImage(file) async {

 var snapshot = await STORAGE.ref()
          .child('images/${USER_?.uid}/${file.toString().replaceAll('.', '').trim().replaceAll('/', '')}')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
   return downloadUrl;

}