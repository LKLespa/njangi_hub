import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:njangi_hub/shared/functions/toast.dart';
import 'package:toastification/toastification.dart';

Future<String?> uploadFileToDb({required File file, required String path}) async {
  final storage = FirebaseStorage.instance;
  final storageRef = storage.ref();

  try {
    final fileRef = storageRef.child(path);
    final uploadTask = await fileRef.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  } catch(e){
    toast(message: e.toString(), type: ToastificationType.error);
  }
  return null;
}