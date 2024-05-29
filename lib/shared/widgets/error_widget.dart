import 'package:flutter/material.dart';

// TODO: Add lottie animations

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error),
            SizedBox(height: 10),
            Text('Oops! Something went wrong'),
          ],
        ),
      ),
    );
  }
}
