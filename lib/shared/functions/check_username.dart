import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:toastification/toastification.dart';

Future<bool?> checkIfUsernameExist({required String username}) async {
  final db = FirebaseFirestore.instance;
  db.settings = const Settings(persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  try {
    final docRef =
    db.collection("users").where("username", isEqualTo: username);
    final userNameExist = await docRef.get().then((querySnapshot) {
      return querySnapshot.docs.isNotEmpty;
    });
    return userNameExist;
  } catch (error) {
    toast(message: error.toString(), type: ToastificationType.error);
    return null;
  }
}