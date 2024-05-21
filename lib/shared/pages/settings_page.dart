import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    return Scaffold(
        body: Center(
            child: Card(
                child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => theme.toggleThemeMode(),
                child: Text(
                  theme.mode.modeName,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ],
      ),
    ))));
  }
}
