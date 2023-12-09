import 'package:flutter/material.dart';
import 'package:refactor_weather_api/model/weathers.dart';
import 'package:refactor_weather_api/component/reusable_card_widget.dart';
import 'package:refactor_weather_api/weather_data.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Text('${weather.ci}'),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              ReusableCard(
                text: '${weather.minT}',
              ),
              ReusableCard(
                text: '${weather.maxT}',
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              ReusableCard(text: '${weather.pop}'),
              ReusableCard(text: '${weather.wx}'),
            ],
          ),
        )
      ],
    );
  }
}
