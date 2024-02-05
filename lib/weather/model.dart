import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class WeatherModel extends ChangeNotifier {
  List<Map<String, dynamic>> _weatherData = [];

  List<Map<String, dynamic>> get weatherData => _weatherData;

  Future<void> addCity(String cityName) async {
    if (!_weatherData.any((element) => element['city'] == cityName)) {
      await fetchWeatherDataForCity(cityName);
    }
    // else city already added
  }

  Future<void> fetchWeatherDataForCity(String cityName) async {
    const String apiKey = '4ea5f96028ada245979ec11627c5d1ba';
    const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

    try {
      final Uri uri =
          Uri.parse('$apiUrl?q=$cityName&units=metric&appid=$apiKey');
      final request = await HttpClient().getUrl(uri);
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(responseBody);
        final Map<String, dynamic> data = {
          'name': jsonData['name'],
          'main': jsonData["main"],
          // 'weather': jsonData['weather'][0],
        };
        print(data['weather']);
        _weatherData.add({
          'city': cityName,
          'data': data,
        });
        notifyListeners();
      } else {
        throw Exception('Failed to load weather data for $cityName');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to connect to the weather service');
    }
  }

  // Future<void> fetchWeatherDataForCity(String cityName) async {
  //   const String apiKey = '4ea5f96028ada245979ec11627c5d1ba';
  //   const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  //   try {
  //     final dio = Dio();
  //     dio.options.headers['Authorization'] =
  //         'Bearer $apiKey'; // Add API key to headers
  //     final response = await dio.get(
  //       apiUrl,
  //       queryParameters: {'q': cityName, 'units': 'metric'},
  //     );
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> weatherData = response.data;
  //       _weatherData.add({
  //         'city': cityName,
  //         'weather': weatherData,
  //       });
  //       notifyListeners();
  //     } else {
  //       throw Exception('Failed to load weather data for $cityName');
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw Exception('Failed to connect to the weather service');
  //   }
  // }

  // Adding multiple cities
  Future<void> fetchWeatherData(List<String> cityNames) async {
    for (String cityName in cityNames) {
      await fetchWeatherDataForCity(cityName);
    }
  }
}
