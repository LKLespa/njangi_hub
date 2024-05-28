import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void toast({required BuildContext context, String? title, required String message, required ToastificationType type}) {
  final msg = message.length > 50 ? "${message.substring(0, 50)}..." : message;
  toastification.show(
    context: context,
    title: title != null ? Text(title) : null,
    description: Text(msg),
    alignment: Alignment.topCenter,
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 7),
    type: type,
    style: ToastificationStyle.fillColored,
  );
}