import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/settings/model.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, appSettings, child) {
        return SwitchListTile(
          title: const Text('Dark Mode'),
          value: appSettings.isDarkMode,
          onChanged: (value) {
            appSettings.toggleDarkMode();
          },
        );
      },
    );
  }
}
