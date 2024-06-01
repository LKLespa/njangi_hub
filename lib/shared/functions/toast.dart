import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void toast(
    {String? title,
    required String message,
    required ToastificationType type,
    int time = 5,
    Alignment alignment = Alignment.topCenter}) {
  final msg = message.length > 75 ? "${message.substring(0, 75)}..." : message;
  Icon? icon;
  switch (type) {
    case ToastificationType.success:
      icon = const Icon(Icons.check_circle);
      break;
    case ToastificationType.warning:
      icon = const Icon(Icons.warning);
      break;
    case ToastificationType.error:
      icon = const Icon(Icons.error);
      break;
    case ToastificationType.info:
      icon = const Icon(Icons.info);
      break;
  }

  toastification.dismissAll();
  toastification.show(
    title: title != null ? Text(title) : null,
    description: Text(msg),
    alignment: alignment,
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: Duration(seconds: time),
    type: type,
    icon: icon,
    style: ToastificationStyle.fillColored,
  );
}
