import 'package:flutter/material.dart';
import 'package:refactor_weather_api/view/forecast_page.dart';
import 'view/home_page.dart';

void main() => runApp(const WeatherForecast());

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomePage(),
    );
  }
}
