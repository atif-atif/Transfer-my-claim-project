import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer/appconstants/RepeatedVarables.dart';

import 'upload_profile.dart';

Future<void> set_profile(
    {file,
    image,
    name,
    experience,
    city,
    phoneNumber,
    firstName,
    lastName,
    description,
    qualification,
    specialities}) async {
  try {
    var doc =
        FIRESTORE.collection(ROLE == 'U' ? 'users' : "lawyers").doc(USER_?.uid);
    if (file != null) image = await uploadImage(file);
    print(image);
    await doc.update({
      'userName': name ?? "",
      'image': image ?? "",
      'experience': experience ?? "",
      'phoneNumber': phoneNumber ?? "",
      'firstName': firstName ?? "",
      'lastName': lastName ?? "",
      'description': description ?? "",
      'qualification': qualification ?? "",
      'specialities': specialities ?? "",
      'city': city ?? "",
    });
    Fluttertoast.showToast(
        msg: "Profile Updated)",
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  } catch (e) {
  } finally {}
}
