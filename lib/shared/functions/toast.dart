import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void toast({required BuildContext context, String? title, required String message, required ToastificationType type}) {
  toastification.show(
    context: context,
    title: title != null ? Text(title) : null,
    description: Text("${message.substring(0, 50)}..."),
    alignment: Alignment.topCenter,
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 5),
    type: type,
    style: ToastificationStyle.fillColored,
  );
}