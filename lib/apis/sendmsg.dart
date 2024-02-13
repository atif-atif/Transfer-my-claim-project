import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lawyer/appconstants/RepeatedVarables.dart';

Future<void>sendmsg({receiverid,msg})async{
  var receiver=FIRESTORE.collection('chats').doc(receiverid).collection(USER_!.uid).doc(USER_?.uid);
  var sender=FIRESTORE.collection('chats').doc(USER_?.uid).collection(receiverid).doc(receiverid);
  var rcontact= FIRESTORE.collection('contacts').doc(receiverid);
  var scontact= FIRESTORE.collection('contacts').doc(USER_?.uid);
  try{
  var time=DateTime.now();
  var exists=await receiver.get();
  if(exists.exists) {
    await receiver.update({'cahatlist': FieldValue.arrayUnion([{
      'uid': USER_?.uid,
      'msg': msg,
      'time': time,
    }
    ])});

  }
  else {
    await receiver.set({'cahatlist': FieldValue.arrayUnion([{
      'uid': USER_?.uid,
      'msg': msg,
      'time': time,
    }
    ])});

  }
   exists=await sender.get();
  if(exists.exists) {
    await sender.update({'cahatlist': FieldValue.arrayUnion([{
      'uid': receiverid,
      'msg': msg,
      'time': time,
    }
    ])});

  }
  else{
    await sender.set({'cahatlist':FieldValue.arrayUnion([{
      'uid':receiverid,
      'msg':msg,
      'time':time,
    }])});


  }
  exists=await rcontact.get();
  if(exists.exists)
  await rcontact.update({
    "contactslist":FieldValue.arrayUnion([USER_?.uid])
  });
  else
  await rcontact.set({
    "contactslist":FieldValue.arrayUnion([USER_?.uid])
  });
  exists=await scontact.get();
  if(exists.exists)
  await scontact.update({
    "contactslist":FieldValue.arrayUnion([receiverid])
  });
  else
  await scontact.set({
    "contactslist":FieldValue.arrayUnion([receiverid])
  });
}catch(e){}finally{}
}
