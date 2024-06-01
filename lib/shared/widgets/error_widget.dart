import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// TODO: Add lottie animations

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, this.error});
  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.error, color: Colors.red,),
            const SizedBox(height: 10),
            const Text('Oops! Something went wrong', style: TextStyle(color: Colors.red),),
            const Gap(5),
            Text("${error ?? ""}")
          ],
        ),
      ),
    );
  }
}
