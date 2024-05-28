import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:toastification/toastification.dart';

Future<bool> checkInternetConnectivity({required BuildContext context, bool showIfTrue = true, showIfFalse = true}) async {
  final hasInternet = await InternetConnection().hasInternetAccess;
  print('~Checking Internet access~..............................');
  if(context.mounted){
    if(hasInternet && showIfTrue){
      toast(context: context, message: "Internet Connection", type: ToastificationType.success);
    } else if (showIfFalse) {
      toast(context: context, title: "No Internet Connection", message: "Please Check your internet connection", type: ToastificationType.warning);
    }
  }

  return hasInternet;
}

StreamSubscription<InternetStatus> listenToInternetChanges({required BuildContext context, bool showChanges = true}) {
  print('Listening to Internet changes...........................\n\n\n\n\n\n\n\n\n');
  return InternetConnection().onStatusChange.listen((status) {
    if (showChanges){
      switch(status) {
        case InternetStatus.connected:
          toast(context: context, message: "Back online", type: ToastificationType.success);
        case InternetStatus.disconnected:
          toast(context: context, message: "Your offline", type: ToastificationType.warning);
      }
    }
  });
}