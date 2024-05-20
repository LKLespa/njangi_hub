import 'package:flutter/material.dart';
import 'package:njangi_hub/generated/assets.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/intro');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Hero(tag: 'logo', child: Image.asset(Assets.imagesLogo1, width: 150,)),
      ),
    );
  }
}