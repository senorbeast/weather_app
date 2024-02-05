import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/theme/theme.dart';
import 'package:weather_app/settings/controller.dart';
import 'package:weather_app/settings/model.dart';
import 'package:weather_app/settings/view.dart';
import 'package:weather_app/weather/controller.dart';

class AppRoot extends StatefulWidget {
  final ThemeMode themeMode;

  const AppRoot({
    super.key,
    required this.themeMode,
  });

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();
    return MaterialApp(
      themeMode: widget.themeMode,
      theme: theme.toThemeData(),
      darkTheme: theme.toThemeDataDark(),
      routes: {
        '/settings': (context) => const AppSettingsController(),
      },
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        final tt = Theme.of(context).textTheme;
        final cs = Theme.of(context).colorScheme;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: cs.onTertiary,
            title: Text(
              'Weather',
              style: tt.titleMedium!.copyWith(
                color: cs.onTertiaryContainer,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<AppSettings>(context, listen: false)
                      .toggleDarkMode();
                },
                icon: const Icon(Icons.light_mode),
              ),
            ],
          ),
          body: const WeatherController(),
          drawer: const AppSettingsView(),
          // body: const AuthenticationView(),
        );
      }),
    );
  }
}
