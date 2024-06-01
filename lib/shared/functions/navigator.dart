import 'package:flutter/material.dart';

Future<Object?>  navigatorPush({required BuildContext context, required Widget nextPage}){
  return Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => nextPage,
  ));
}