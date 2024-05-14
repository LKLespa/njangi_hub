import 'package:flutter/material.dart';
import 'package:njangi_hub/generated/assets.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Assets.imagesLogo1, width: 150,),
    );
  }
}