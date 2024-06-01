import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:toastification/toastification.dart';

Future<bool> checkInternetConnectivity(
    {bool showIfConnected = true, showIfNotConnected = true}) async {
  final hasInternet = await InternetConnection().hasInternetAccess;
  if (hasInternet && showIfConnected) {
    toast(message: "Internet Connection", type: ToastificationType.success);
  } else if (!hasInternet && showIfNotConnected) {
    toast(
        title: "No Internet Connection",
        message: "Please Check your internet connection",
        type: ToastificationType.warning);
  }

  return hasInternet;
}

StreamSubscription<InternetStatus> listenToInternetChanges({bool showChanges = true}) {
  int listenCount = 0;
  return InternetConnection().onStatusChange.listen((status) {
    listenCount++;
    print("LISTENING: $listenCount");
    if (showChanges) {
      switch (status) {
        case InternetStatus.connected:
          if(listenCount > 2) {
            toast(message: "Back online", type: ToastificationType.success, time: 2);
          }
        case InternetStatus.disconnected:
          toast(message: "Your offline", type: ToastificationType.warning, time: 2);
      }
    }
  });
}
