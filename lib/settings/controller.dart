import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/settings/model.dart';
import 'package:weather_app/settings/view.dart';

class AppSettingsController extends StatelessWidget {
  const AppSettingsController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: const AppSettingsView(),
    );
  }
}
