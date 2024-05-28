import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Hero(tag: 'logo', child: Image.asset(Assets.imagesLogo1, width: 150,)),
      ),
    );
  }
}