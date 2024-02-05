import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/widgets/dropdown_selector.dart';
import 'package:weather_app/weather/model.dart';

const List<String> cities = [
  "Bangalore",
  "Moscow",
  "Wuhan",
  "Chennai",
  "Bangkok",
  "New York",
  "Cairo",
  "Delhi",
  "Mumbai",
  "Tokyo",
  "Shanghai",
  "Sao Paulo",
  "Mexico City",
  "Beijing",
  "Dhaka",
  "Osaka",
  "Karachi",
  "Chongqing",
  "Istanbul",
  "Buenos Aires",
  "Kolkata",
  "Lagos",
  "Kinshasa",
  "Manila",
  "Rio de Janeiro",
  "Tianjin",
  "Guangzhou",
  "Lahore",
  "Shenzhen",
];

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  String newCity = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(
      builder: (context, weatherModel, child) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: DropdownSelector(
                    dropDownOptions: cities,
                    valueChanged: (value) {
                      setState(() {
                        newCity = value;
                      });
                      print(newCity);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (!weatherModel.weatherData
                        .any((eachCity) => eachCity['city'] == newCity)) {
                      weatherModel.addCity(newCity);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('City already added'),
                      ));
                    }
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            // Weather List
            Expanded(
              child: ListView.builder(
                itemCount: weatherModel.weatherData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> cityData =
                      weatherModel.weatherData[index]['data'];

                  return ListTile(
                    title: Text(cityData['name']),
                    // subtitle: Text(cityData['weather']['description']),
                    trailing: Text('${cityData['main']['temp']}°C'),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
