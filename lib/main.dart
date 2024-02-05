import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/app_root.dart';
import 'package:weather_app/settings/model.dart';
import 'package:weather_app/weather/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherModel()),
        ChangeNotifierProvider(create: (_) => AppSettings()),
      ],
      child: Consumer<AppSettings>(
        builder: (context, value, child) {
          if (value.isDarkMode) {
            return const AppRoot(themeMode: ThemeMode.dark);
          }
          return const AppRoot(themeMode: ThemeMode.light);
        },
      ),
    );
  }
}
