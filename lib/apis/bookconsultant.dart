import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lawyer/appconstants/RepeatedVarables.dart';

Future<void>bookconsultant({lawyerid,uname,email,phone,query,flg=0,uid})async{
 var number= DateTime.now().toString();
  try {
    var docl = FIRESTORE.collection(flg==0?'lawyersrequests':'lawyerbooked').doc(lawyerid);
    var exists = await docl.get();
    if (exists.exists)
      await docl.update({"bookings":FieldValue.arrayUnion([{
      "username": uname ?? "",
      "email": email ?? "",
      "phone": phone ?? "",
      "uid": uid??USER_?.uid,
      "query": query ?? "",
      "requestnumber":number ,
      }])
      });
    else
      await docl.set({"bookings":FieldValue.arrayUnion([{
        "username": uname ?? "",
        "email": email ?? "",
        "phone": phone ?? "",
        "uid": uid??USER_?.uid,
        "query": query ?? "",
        "requestnumber":number ,
      }])
      });
    var docu = FIRESTORE.collection(flg==0?'users_requests':"hiredbyusers").doc(uid??USER_?.uid);
    exists = await docu.get();
    if (exists.exists)
      await docu.update({"bookings":FieldValue.arrayUnion([{
      "uid": lawyerid,
        "requestnumber":number ,
      }])
      });
    else
      await docu.set({"bookings":FieldValue.arrayUnion([{
        "uid": lawyerid,
        "requestnumber":number ,
      }])
      });
    Fluttertoast.showToast(msg: "Successfully request sent!!",toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER);
   Get.back();
  }catch(e){}
}