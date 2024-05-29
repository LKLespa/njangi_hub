import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A function that listens to Firebase Authentication state changes and performs actions based on the user's state.
///
/// This function returns a [StreamSubscription] that can be used to cancel the subscription.
///
/// [whenUserHasData] is a required callback function that will be called when a user is authenticated and their data exists in Firestore.
///
/// [whenNoUser] is a required callback function that will be called when there is no user authenticated.
///
/// [whenUserHasNoData] is a required callback function that will be called when a user is authenticated but their data does not exist in Firestore.
///
/// [onError] is an optional callback function that will be called when an error occurs during the process.
///
/// This function sets Firestore persistence to enabled and cache size to unlimited.
StreamSubscription<User?> onAuthChanges({
  required void Function(User user, DocumentSnapshot<Map<String, dynamic>> doc) whenUserHasData,
  required void Function(User user) whenUserHasNoData,
  required void Function() whenNoUser,
  void Function(Exception e)? onError,
}) {
  return FirebaseAuth.instance.userChanges().listen((user) async {
    print("Auth state changed");
    if (user!= null) {
      try {
        final db = FirebaseFirestore.instance;
        db.settings = const Settings(
            persistenceEnabled: true,
            cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
        final docRef = db.collection("users").doc(user.uid);
        final doc = await docRef.get();
        if (doc.exists) {
          whenUserHasData(user, doc);
        } else {
          whenUserHasNoData(user);
        }
      } catch (e) {
        onError!(e as Exception);
      }
    } else {
      whenNoUser();
    }
  });
}