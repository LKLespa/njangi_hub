import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:njangi_hub/shared/functions/toast.dart';
import 'package:toastification/toastification.dart';

Future<String?> uploadFileToDb({required File file, required String path}) async {
  final storage = FirebaseStorage.instance;
  try {
    final uploadTask = storage.ref().child(path).putFile(file);
    final snapshot = await uploadTask;
    String fileUrl = await snapshot.ref.getDownloadURL();
    print("IMAGE URL $fileUrl");
    return fileUrl;
  } catch(e){
    toast(message: e.toString(), type: ToastificationType.error);
  }
  return null;
}