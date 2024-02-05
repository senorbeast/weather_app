import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather/model.dart';
import 'package:weather_app/weather/view.dart';

class WeatherController extends StatelessWidget {
  const WeatherController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherModel(),
      child: const WeatherView(),
    );
  }
}
